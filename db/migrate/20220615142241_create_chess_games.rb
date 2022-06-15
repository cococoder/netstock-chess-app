class CreateChessGames < ActiveRecord::Migration[7.0]
  def change
    create_table :chess_games do |t|
      t.integer :black_player
      t.integer :white_player
      t.integer :winner

      t.timestamps
    end
  end
end
