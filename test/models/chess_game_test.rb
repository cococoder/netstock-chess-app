# == Schema Information
#
# Table name: chess_games
#
#  id           :integer          not null, primary key
#  black_player :integer
#  white_player :integer
#  winner       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class ChessGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
