class WishlistsController < ApplicationController
  def index
    @user = current_user
    if user_signed_in? && current_user.wishlist
      @wishlist = current_user.wishlist.wishlist_items
    else
      flash[:no_wishlist] = "You currently don't have any items in your wishlist"
      redirect_to request.referer
    end
  end

  def create
    if !current_user.wishlist
      wishlist = Wishlist.create(user_id: current_user.id)
    else
      wishlist = current_user.wishlist
    end
    game = Game.find(params[:game_id])
    game.in_wishlist = true
    wishlist.games << game
    flash[:added_item] = "Successfully added item to your wishlist!"
    redirect_to request.referer
  end

  def destroy
  end
end
