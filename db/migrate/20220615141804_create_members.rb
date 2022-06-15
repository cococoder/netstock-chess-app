class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :surname
      t.string :email_address
      t.string :date_of_birth

      t.timestamps
    end
  end
end
