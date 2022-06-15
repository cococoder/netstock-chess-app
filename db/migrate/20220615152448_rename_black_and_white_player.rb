class RenameBlackAndWhitePlayer < ActiveRecord::Migration[7.0]
  def change
    rename_column :chess_games, :black_player, :black_player_id
    rename_column :chess_games, :white_player, :white_player_id
  end
end
