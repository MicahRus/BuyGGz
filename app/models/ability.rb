# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:index, :show, :new, :create], Game
    can [:edit, :update, :destroy], Game, user_id: user.id

    can :manage, :all if user.is_admin == true
    
  end
end
