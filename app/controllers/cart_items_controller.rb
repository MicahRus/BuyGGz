class CartItemsController < ApplicationController
  
  def destroy
    # Finds a game
    @game = Game.find(params[:id])
    #Finds a game if the id is the same as the id currently looking for. 
    @cart_item = CartItem.where(game_id: @game.id).first
    # This sets the games status of in cart to false, just to help with listing the games.
    @game.in_cart = false
    @game.save
    @cart_item.destroy

    redirect_to request.referer
  end
end
