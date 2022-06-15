require "test_helper"

class LeaderBoard
  def initialize(members:)
    @members = members
  end
  def rank ;end

  def first
    @members.first
  end
end

class LeaderBoardTest <  ActiveSupport::TestCase
  def test_100_mebers
    assert_equal(Member.count,100)
  end
  def test_leader_board_first_is_ranked_1

    #given
    members = Member.all

    #when
    leader_board = LeaderBoard.new(members: members)
    leader_board.rank

    #then
    assert_equal(leader_board.first.rank,1)
  end
  def test_leader_board_last_is_ranked_100

    #given
    members = Member.all

    #when
    leader_board = LeaderBoard.new(members: members)
    leader_board.rank

    #then
    assert_equal(leader_board.last.rank,100)
  end
end

