# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Member.create first_name: Faker::Name.first_name,
                surname: Faker::Name.last_name,
                email_address: Faker::Internet.email,
                date_of_birth: Faker::Date.between(from: '1970-01-01', to: '2010-01-31')
end