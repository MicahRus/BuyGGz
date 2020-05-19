class WishlistItemsController < ApplicationController
  def destroy
    @game = Game.find(params[:id])
    @wishlist_item = WishlistItem.where(game_id: @game.id).first
    @game.in_wishlist = false
    @game.save
    @wishlist_item.destroy

    redirect_to request.referer
  end
end
