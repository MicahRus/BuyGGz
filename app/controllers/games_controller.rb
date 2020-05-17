class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @games = Game.search(params[:search])
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    @game.cost = @game.cost * 100
    if @game.save
      redirect_to @game
      flash[:success] = "You successfully created a new game!"
    else
      flash[:failed] = "You failed to create a new game!:("
      redirect_to request.referer
    end
  end

  def edit
    @game.cost = @game.cost / 100
  end

  def update
    if @game.update(game_params)
      @game.update(cost: (@game.cost * 100))
      redirect_to game_path(@game)
    else
      redirect_to request.referer
      flash[:failed] = "You failed to update a new game!:("
    end
  end

  def destroy
    @game.destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :platform, :cost, :username, :image)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
