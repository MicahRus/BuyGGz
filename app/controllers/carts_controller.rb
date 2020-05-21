class CartsController < ApplicationController
  def index
    @user = current_user
    # Checks if the user is signed in and already has an active cart
    if user_signed_in? && current_user.cart
      @cart = current_user.cart.games.includes([:image_attachment])
    else
      flash[:no_cart] = "You currently don't have any items in your cart"
      redirect_to request.referer
    end
  end

  def create
    # Checks if the user has a cart, if they do it loads that cart.
    if !current_user.cart
      cart = Cart.create(completed: false, user_id: current_user.id)
    else
      cart = current_user.cart
    end
    game = Game.find(params[:game_id])
    game.in_cart = true
    cart.games << game
    flash[:added_item] = "Successfully added item to your cart!"
    redirect_to request.referer
  end

  def destroy
    @cart = current_user.cart
    @cart.cart_item.destroy
  end
end
