# == Schema Information
#
# Table name: chess_games
#
#  id              :integer          not null, primary key
#  draw            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  black_player_id :integer
#  loser_id        :integer
#  white_player_id :integer
#  winner_id       :integer
#
require "test_helper"

class RankState
  def initialize(members:)
    @items = []
    members.each do |m|
      @items << m
    end
  end

  def length
    @items.count
  end
  def first
    @items.first
  end
  def last
    @items.last
  end
end

class RankStateTest < ActiveSupport::TestCase
  test "build state" do
    rank_state = RankState.new(members: Member.all)
    assert_equal rank_state.length , Member.count
  end
  test "get first" do
    rank_state = RankState.new(members: Member.all)
    assert_equal rank_state.first , Member.first
  end
  test "get last" do
    rank_state = RankState.new(members: Member.all)
    assert_equal rank_state.last, Member.last
  end
end
