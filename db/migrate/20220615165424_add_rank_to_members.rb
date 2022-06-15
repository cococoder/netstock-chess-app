class AddRankToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :rank, :integer
  end
end
