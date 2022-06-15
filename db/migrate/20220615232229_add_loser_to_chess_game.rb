class AddLoserToChessGame < ActiveRecord::Migration[7.0]
  def change
    add_column :chess_games, :loser_id, :integer
  end
end
