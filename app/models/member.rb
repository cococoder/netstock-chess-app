# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  email_address :string
#  first_name    :string
#  rank          :integer
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Member < ApplicationRecord
  default_scope { order(rank: :asc) }
  def fullname
    "#{first_name} #{surname}"
  end
  def to_s
    fullname
  end
end
