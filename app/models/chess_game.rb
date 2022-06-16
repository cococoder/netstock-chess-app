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

class ChessGame < ApplicationRecord
  validates :black_player_id, presence: true
  validates :white_player_id, presence: true
  validates :winner_id, presence: true, unless: ->{ self.draw == true}
  validate :player_cant_play_them_selves
  validate :the_winner_has_to_be_one_of_the_players_selected, unless: ->{ self.draw == true}
  after_create_commit :set_loser
  after_create_commit :add_leader_board_changes

  def player_cant_play_them_selves
    if black_player_id == white_player_id
      errors.add(:black_player_id, "A player cant play them selves!")
    end
  end

  def the_winner_has_to_be_one_of_the_players_selected

    if ![black_player_id,white_player_id].include? winner_id
      errors.add(:winner, "You have chosen a winnder, who is not in the game")
    end
  end

  belongs_to :black_player, class_name: "Member", foreign_key: :black_player_id
  belongs_to :white_player, class_name: "Member", foreign_key: :white_player_id
  belongs_to :winner, class_name: "Member", foreign_key: :winner_id, optional: true
  belongs_to :loser, class_name: "Member", foreign_key: :loser_id, optional: true
  def set_loser
    self.update loser_id: [self.black_player_id, self.white_player_id].reject { |id| id == self.winner_id }.first
  end
  def add_leader_board_changes

  end
end
