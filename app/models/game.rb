class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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
