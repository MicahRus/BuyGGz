class GamesController < ApplicationController
  # At the bottom of the page there is a method that will be ran before each of the method's listed after the ":only"
  before_action :find_game, only: [:show, :edit, :update, :destroy]
  # This will set the list of all available platforms.
  before_action :platforms, only: [:new, :edit]
  load_and_authorize_resource

  def index
    # Using the search query I created it will list games with only the search parameter inserted
    @games = Game.search(params[:search])
  end

  def show
  end

  def new
    @game = Game.new
    a
  end

  def create
    @game = current_user.games.create(game_params)
    # Sets the posted_by variable to be the current users username.
    @game.posted_by = current_user.username
    # Multiplies the cost the user inserts by 100 (to turn it into cents)
    @game.cost = @game.cost * 100
    # If the game has been appropriately filled out it will save the game, if not it will refresh the page and display the error message.
    if @game.save
      redirect_to @game
      flash[:success] = "You successfully created a new game!"
    else
      flash[:failed] = "You failed to create a new game!:("
      redirect_to request.referer
    end
  end

  def edit
    # This will display the games cost in an appropriate value.
    @game.cost = @game.cost / 100
  end

  def update
    if @game.update(game_params)
      # Ensures the value is converted to cents
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
    # Only allows these fields to be changed when creating a new game.
    params.require(:game).permit(:title, :platform, :cost, :username, :image)
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def platforms
    @platforms = [
      "macOS", "Game Boy Advance", "Xbox One", "Xbox", "Windows", "Nintendo DS", "GameCube", "Nintendo 64", "PlayStation Portable", "Game Gear", "PlayStation 2", "Nintendo DSi", "Sega Master System", "Super Nintendo Entertainment System", "Virtual Boy", "Wii", "Xbox 360", "Game Boy", "PlayStation 3", "PlayStation 4", "PlayStation Vita", "Game Boy Color", "Linux", "Sega Dreamcast", "Sega Genesis", "Nintendo Entertainment System", "Nintendo Switch", "Wii U", "Nintendo 3DS", "PlayStation", "Sega Saturn"
    ]
  end
end
