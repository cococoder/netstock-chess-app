require "test_helper"

class ChessGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chess_game = chess_games(:one)
  end

  test "should get index" do
    get chess_games_url
    assert_response :success
  end

  test "should get new" do
    get new_chess_game_url
    assert_response :success
  end

  test "should create chess_game" do
    assert_difference("ChessGame.count") do
      post chess_games_url, params: { chess_game: { black_player_id: @chess_game.black_player_id, white_player_id: @chess_game.white_player_id, winner_id: @chess_game.winner_id } }
    end

    assert_redirected_to chess_game_url(ChessGame.last)
  end

  test "should not create chess_game if black_player,white_player or winnder not supplied" do
    assert_no_difference("ChessGame.count") do
      post chess_games_url, params: { chess_game: { black_player_id: nil, white_player_id: @chess_game.white_player_id, winner_id: @chess_game.winner_id } }
    end
  end

  test "a player cant play them selves" do
    assert_no_difference("ChessGame.count") do
      post chess_games_url, params: { chess_game: { black_player_id: @chess_game.white_player_id, white_player_id: @chess_game.white_player_id, winner_id: @chess_game.winner_id } }
    end
  end

  test "should show chess_game" do
    get chess_game_url(@chess_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_chess_game_url(@chess_game)
    assert_response :success
  end

  test "should update chess_game" do
    patch chess_game_url(@chess_game), params: { chess_game: { black_player_id: @chess_game.black_player_id, white_player_id: @chess_game.white_player_id, winner_id: @chess_game.winner_id } }
    assert_redirected_to chess_game_url(@chess_game)
  end

  test "should destroy chess_game" do
    assert_difference("ChessGame.count", -1) do
      delete chess_game_url(@chess_game)
    end

    assert_redirected_to chess_games_url
  end
end
