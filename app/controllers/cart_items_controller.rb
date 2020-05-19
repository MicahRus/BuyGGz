class CartItemsController < ApplicationController
  def destroy
    @game = Game.find(params[:id])
    @cart_item = CartItem.where(game_id: @game.id).first
    @game.in_cart = false
    @game.save
    @cart_item.destroy

    redirect_to request.referer
  end
end
