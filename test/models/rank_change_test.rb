# == Schema Information
#
# Table name: leader_board_changes
#
#  id         :integer          not null, primary key
#  from       :integer
#  to         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer          not null
#
# Indexes
#
#  index_leader_board_changes_on_member_id  (member_id)
#
# Foreign Keys
#
#  member_id  (member_id => members.id)
#
require "test_helper"

class RankChangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
