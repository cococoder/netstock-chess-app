class ChessGamesController < ApplicationController
  before_action :set_chess_game, only: %i[ show edit update destroy ]

  # GET /chess_games
  def index
    @chess_games = ChessGame.all
  end

  # GET /chess_games/1
  def show
  end

  # GET /chess_games/new
  def new
    @chess_game = ChessGame.new
  end

  # GET /chess_games/1/edit
  def edit
  end

  # POST /chess_games
  def create
    @chess_game = ChessGame.new(chess_game_params)

    if @chess_game.save
      redirect_to @chess_game, notice: "Chess game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chess_games/1
  def update
    if @chess_game.update(chess_game_params)
      redirect_to @chess_game, notice: "Chess game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /chess_games/1
  def destroy
    @chess_game.destroy
    redirect_to chess_games_url, notice: "Chess game was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chess_game
      @chess_game = ChessGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chess_game_params
      params.require(:chess_game).permit(:black_player_id, :white_player_id, :winner_id)
    end
end
