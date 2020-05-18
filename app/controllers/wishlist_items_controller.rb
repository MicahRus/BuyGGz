class WishlistItemsController < ApplicationController
  def destroy
    @wishlist_item = WishlistItem.where(params[:game_id]).first
    @game = Game.find(params[:id])
    @game.in_wishlist = false
    @game.save
    @wishlist_item.destroy
    
    redirect_to request.referer
  end
end
