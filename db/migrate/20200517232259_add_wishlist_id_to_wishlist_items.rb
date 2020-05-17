class AddWishlistIdToWishlistItems < ActiveRecord::Migration[6.0]
  def change
    add_column :wishlist_items, :wishlist_id, :integer
  end
end
