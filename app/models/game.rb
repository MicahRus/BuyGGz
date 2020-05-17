class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :cart_items
  has_many :carts, through: :cart_items
  
  has_many :wishlist_items
  has_many :wishlists, through: :wishlist_items

  def self.search(search)
    if search
      user = User.find_by(username: search)
      if user
        self.where(user_id: user)
      else
        Game.all
      end
    else
      Game.all
    end
  end
end
