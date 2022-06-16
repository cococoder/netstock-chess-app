class AddPreviousRankToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :previous_rank, :integer
  end
end
