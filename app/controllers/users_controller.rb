class UsersController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @user = User.where(username: params[:username])[0]
  end
end
