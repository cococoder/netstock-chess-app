# == Schema Information
#
# Table name: chess_games
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  black_player_id :integer
#  white_player_id :integer
#  winner_id       :integer
#
class ChessGame < ApplicationRecord
  validates :black_player_id, presence: true
  validates :white_player_id, presence: true
  validates :winner_id, presence: true

  belongs_to :black_player, class_name: "Member", foreign_key: :black_player_id
  belongs_to :white_player, class_name: "Member", foreign_key: :white_player_id
  belongs_to :winner, class_name: "Member", foreign_key: :winner_id
end
