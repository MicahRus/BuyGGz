class RemovePostedOnFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :posted_on, :date
  end
end
