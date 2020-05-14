class CartsController < ApplicationController
  def index
    if user_signed_in? && current_user.cart
      @cart = current_user.cart.games
    else
      flash[:no_cart] = "You currently don't have any items in your cart"
      redirect_to request.referer
    end
  end

  def create
    if !current_user.cart
      cart = Cart.create(completed: false, user_id: current_user.id)
    else
      cart = current_user.cart
    end
    game = Game.find(params[:game_id])
    game.in_cart = true
    cart.games << game
    redirect_to request.referer
  end

  def show
    @cart = current_user.cart.games
    @user = User.find(current_user.id)
  end
end
