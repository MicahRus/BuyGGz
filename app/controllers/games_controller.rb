class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    if @game.errors.any?
      @game.errors.full_messages.first
      flash[:failed] = "You failed to create a new game!"
      redirect_to request.referer
    else
      redirect_to @game
      flash[:success] = "You successfully created a new game!"
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :cost, :platform)
  end
end
