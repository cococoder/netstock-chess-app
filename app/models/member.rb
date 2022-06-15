class Member < ApplicationRecord

  def fullname
    "#{first_name} #{surname}"
  end
end
