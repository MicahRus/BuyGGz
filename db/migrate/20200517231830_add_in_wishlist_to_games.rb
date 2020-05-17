class AddInWishlistToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :in_wishlist, :boolean
  end
end
