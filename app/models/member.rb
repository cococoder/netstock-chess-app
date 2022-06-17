# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  email_address :string
#  first_name    :string
#  previous_rank :integer
#  rank          :integer          default(0)
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Member < ApplicationRecord
  default_scope { order(rank: :asc) }

  before_create :set_rank
  after_save :record_rank_change

  def games
    result = []
    ChessGame.where(black_player_id: self.id).or(ChessGame.where(white_player_id:self.id)).each {|chess_game|result << chess_game}
    result
  end


  def fullname
    "#{first_name} #{surname}"
  end
  def to_s
    "#{fullname} - (#{rank.ordinalize})"
  end

  def adjacent_to? player:
    self.rank - player.rank * 1 == 1
  end

  def ranked_higher_than? member
    self.rank > member.rank
  end

  def premote!
    move_to new_rank: self.rank - 1
  end
  def demote!
    move_to new_rank: self.rank + 1
  end
  def move_to new_rank:
    self.update previous_rank: self.rank, rank: new_rank
  end

  def record_rank_change
    RankChange.create member: self, previous: previous_rank, current: self.rank
  end

  private

  def set_rank
    if Member.last
      self.rank = Member.last.rank + 1
    else
      self.rank = 1
    end
  end
end
