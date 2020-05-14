class AddInCartToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :in_cart, :boolean
  end
end
