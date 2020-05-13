class Cart < ApplicationRecord
  has_many :cart_items
  has_many :games, through: :cart_item
  belongs_to :user
end
