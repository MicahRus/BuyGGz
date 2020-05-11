class UsersController < ApplicationController
  def index
    @games = Game.all
  end
end
