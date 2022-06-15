class AddDrawToChessGame < ActiveRecord::Migration[7.0]
  def change
    add_column :chess_games, :draw, :boolean, default: false
  end
end
