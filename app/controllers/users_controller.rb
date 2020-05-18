class UsersController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    if user_signed_in?
      @user = User.where(username: params[:username])[0]
    else
      @user = User.find(params[:id])
    end
  end
end
