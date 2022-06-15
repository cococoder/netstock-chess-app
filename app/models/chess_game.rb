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
class ChessGame < ApplicationRecord

end
