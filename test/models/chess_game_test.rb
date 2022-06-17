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
  test 'higher ranked player wins' do
    game = chess_games(:high_rank_win)
    game.set_loser
    player_1 = members(:member_1)
    Member.first(10).each{|m| puts m}
    assert_equal "1 > #{player_1.fullname} - (1st) - ", player_1.to_s
  end

  test 'lower ranked player wins' do
    game = chess_games(:low_rank_win)
    game.set_loser
    game.change_rankings

    puts "winner: #{game.winner}"
    puts "loser: #{game.loser}"


    player_1 = members(:member_1)
    Member.first(10).each{|m| puts m}

    assert_equal "1 > #{player_1.fullname} - (2nd) - 1st", player_1.to_s
  end

  test 'draw - lower ranked moves up 1' do
    game = chess_games(:draw)
    game.change_rankings
    lowest_rank_player = game.lowest_rank_player

    Member.first(10).each{|m| puts m}

    assert(lowest_rank_player.to_s.include? "- (4th) - 5th")

  end

  test 'Draw - nothing happens when adjacent' do
    game = chess_games(:draw_adjacent)
    game.change_rankings
    lowest_rank_player = game.lowest_rank_player
    Member.first(10).each{|m| puts m}
    refute(lowest_rank_player.to_s.include? "- (1st) - 2nd")

  end



  test "LoweRankedWin 1 and 9" do
    obj = ChessGame::LoweRankedWin.new(high_rank: 1,low_rank: 9)
    assert_equal 4,obj.call
  end
  test "LoweRankedWin 1 and 2" do
    obj = ChessGame::LoweRankedWin.new(high_rank: 1,low_rank: 2)
    assert_equal 0,obj.call
  end

  test "LoweRankedWin 3 and 7" do
    obj = ChessGame::LoweRankedWin.new(high_rank:3,low_rank: 7)
    assert_equal 2,obj.call
  end

  test "LoweRankedWin 1 and 10" do
    obj = ChessGame::LoweRankedWin.new(high_rank: 1,low_rank: 10)
    assert_equal 4,obj.call
  end
  test "LoweRankedWin 1 and 3" do
    obj = ChessGame::LoweRankedWin.new(high_rank: 1,low_rank: 3)
    assert_equal 1,obj.call
  end
end
