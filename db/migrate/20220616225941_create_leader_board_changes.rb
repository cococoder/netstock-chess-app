class CreateLeaderBoardChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :leader_board_changes do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
