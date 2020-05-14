class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :games, through: :cart_items
end
