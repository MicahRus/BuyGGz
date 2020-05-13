class PaymentsController < ApplicationController
  def success
  end

  def get_stripe_id
    @game = Game.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @game.title,
        # description: @game.description,
        amount: @game.cost,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          game_id: @game.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&gameId=#{@game.id}",
      cancel_url: "#{root_url}games"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end
end
