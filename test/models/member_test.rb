# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  email_address :string
#  first_name    :string
#  previous_rank :integer
#  rank          :integer          default(0)
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  test "premote!" do

    member = members(:member_2)
    member.premote!
    assert_equal 2,member.previous_rank
    assert_equal 1,member.rank
  end
  test "demote!" do

    member = members(:member_2)
    member.demote!
    assert_equal 2,member.previous_rank
    assert_equal 3,member.rank
  end

  test "move to rank!" do
    member = members(:member_3)
    member.move_to new_rank: 1
    assert_equal 3,member.previous_rank
    assert_equal 1,member.rank
  end

  test "ranked_first?" do
    member = members(:member_1)
    assert member.ranked_first?
  end

  test "ranked_last?" do
    member = members(:member_100)
    assert member.ranked_last?
  end

  test "adjacent_above" do
    current = members(:member_2)
    next_rank = members(:member_1)
    assert_equal next_rank, current.adjacent_above
  end

  test "adjacent_below" do
    current = members(:member_1)
    previous_rank = members(:member_2)
    assert_equal previous_rank, current.adjacent_below
  end

end
