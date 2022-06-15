# == Schema Information
#
# Table name: chess_games
#
#  id              :integer          not null, primary key
#  winner          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  black_player_id :integer
#  white_player_id :integer
#
require "test_helper"

class ChessGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
