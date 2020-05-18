class WishlistItemsController < ApplicationController

  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
  end
end
