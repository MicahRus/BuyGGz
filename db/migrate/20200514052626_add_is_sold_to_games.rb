class AddIsSoldToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :is_sold, :boolean
  end
end
