class RenameLeaderBoardChangeToRankChange < ActiveRecord::Migration[7.0]
  def change
    rename_table :leader_board_changes, :rank_changes
    rename_column :rank_changes, :from, :previous
    rename_column :rank_changes, :to, :current
  end
end
