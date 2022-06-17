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
  class LoweRankedWin
    def initialize(high_rank:,low_rank:)
      @high_rank = high_rank
      @low_rank = low_rank
    end
    def call
      new_rank = (@low_rank - @high_rank)/2
    end
  end
  validates :black_player_id, presence: true
  validates :white_player_id, presence: true
  validates :winner_id, presence: true, unless: ->{ self.draw == true}
  validate :player_cant_play_them_selves
  validate :the_winner_has_to_be_one_of_the_players_selected, unless: ->{ self.draw == true}

  after_create_commit :change_rankings

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
  def change_rankings
    set_loser
    if(winner.ranked_higher_than? loser)
      puts "No change!"
    else
      loser.demote!
      Member.reorder_from loser,action: :demotion

      new_rank = LoweRankedWin.new(high_rank: loser.rank,low_rank: winner.rank).call

      if new_rank == 0
        winner.premote!
        Member.reorder_from winner
      else
        winner.move_to new_rank: new_rank
        Member.reorder_from winner
      end


    end
  end
end
