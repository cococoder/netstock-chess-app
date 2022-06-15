class AddDefaultValueToRankForMember < ActiveRecord::Migration[7.0]
  def change
    change_column :members, :rank, :integer , default: 0
  end
end
