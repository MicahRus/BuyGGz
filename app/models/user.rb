class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy

  has_one :cart, dependent: :destroy

  has_one :wishlist, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
