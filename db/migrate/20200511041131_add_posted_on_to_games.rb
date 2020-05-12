class AddPostedOnToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :posted_on, :date
  end
end
