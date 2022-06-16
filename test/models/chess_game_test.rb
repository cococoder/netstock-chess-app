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

class ChessGameTest < ActiveSupport::TestCase
  test "higher player winning does not affect the rankings" do

    higher_ranked_player = members(:member_1)
    lower_ranked_player = members(:member_2)

    ChessGame.create black_player: higher_ranked_player,
                     white_player: lower_ranked_player,
                     draw:false,
                     winner: higher_ranked_player

    assert higher_ranked_player.rank == 1
    assert lower_ranked_player.rank == 2
  end

  test "lower ranked player winning " do
    higher_ranked_player = members(:member_1)
    lower_ranked_player = members(:member_10)

    ChessGame.create black_player: higher_ranked_player,
                     white_player: lower_ranked_player,
                     draw:false,
                     winner: lower_ranked_player

    assert_equal 2, higher_ranked_player.rank, "high ranked player did not move down 1"
    assert_equal 5,lower_ranked_player.rank, "lower ranked player did not move up 5"
  end
end
