class PaymentsController < ApplicationController
  # Allows stripe to work with webhooks without an authenticity token
  skip_before_action :verify_authenticity_token, only: [:webhook]
  def success
    @cart = current_user.cart
    # If the page successfully load it changes each game in the database to be sold
    @cart.games.each do |game|
      game.is_sold == true
    end
    @cart.destroy
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    game_id = payment.metadata.game_id
    user_id = payment.metadata.user_id

    p "game id " + game_id
    p "user id " + user_id

    head 200
  end

  def get_stripe_id
    counter = 0
    line_items = []
    @cart = Cart.find(current_user.cart.id)
    @cart.games.length.times do
      hash = { name: @cart.games[counter].title,
               amount: @cart.games[counter].cost,
               currency: 'aud',
               quantity: 1 }
      line_items << hash
      counter += 1
    end
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: line_items,

      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          cart_id: @cart.user_id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&gameId=#{@cart.id}",
      cancel_url: "#{root_url}games"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end
end
