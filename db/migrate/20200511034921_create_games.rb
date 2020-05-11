class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title
      t.integer :cost
      t.string :platform
      t.text :image
      t.string :posted_by

      t.timestamps
    end
  end
end
