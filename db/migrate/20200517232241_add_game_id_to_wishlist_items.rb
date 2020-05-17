class AddGameIdToWishlistItems < ActiveRecord::Migration[6.0]
  def change
    add_column :wishlist_items, :game_id, :integer
  end
end
