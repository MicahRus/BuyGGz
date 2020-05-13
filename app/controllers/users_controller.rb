class UsersController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    # @user = User.where(username: params[:username])[0]
    @user = User.find(params[:id])
  end
end
