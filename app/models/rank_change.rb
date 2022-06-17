# == Schema Information
#
# Table name: rank_changes
#
#  id         :integer          not null, primary key
#  current    :integer
#  previous   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer          not null
#
# Indexes
#
#  index_rank_changes_on_member_id  (member_id)
#
# Foreign Keys
#
#  member_id  (member_id => members.id)
#
class RankChange < ApplicationRecord
  belongs_to :member
end
