# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  email_address :string
#  first_name    :string
#  rank          :integer          default(0)
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Member < ApplicationRecord
  default_scope { order(rank: :asc) }

  before_create :set_rank

  def fullname
    "#{first_name} #{surname}"
  end
  def to_s
    "#{fullname} - (#{rank.ordinalize}}"
  end

  def ranked_higher_than? member
    self.rank < member.rank
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
