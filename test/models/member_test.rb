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
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
