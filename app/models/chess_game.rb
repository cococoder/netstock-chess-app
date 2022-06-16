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

  after_create_commit :set_rank

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

  def set_rank

    self.update loser_id: [self.black_player_id,self.white_player_id ].reject {|id| id == self.winner_id}.first

    current_ranking do |ranks|

      if winner.ranked_higher_than? loser
        logger.info "No change in ranking"
        return ranks
      else
        logger.info "loser ,moves 1 place down"

        p loser.prev

        ranks.insert loser, after: loser
        logger.info "winner ,moves to rank #{adjust_for_zero_index((winner.rank - loser.rank)/2)}"
      end

      ranks
    end
  end

  private

  def current_ranking
    ranks = LinkedList::List.new
    Member.all.map { |m| ranks << m }
    updated_ranks = yield ranks
    updated_ranks.to_a.each_with_index do |m,rank|
      m.update rank: adjust_for_zero_index(rank)
    end
  end

  def adjust_for_zero_index(rank)
    rank + 1
  end

end
