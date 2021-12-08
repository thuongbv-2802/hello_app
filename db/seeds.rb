# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times { Company.create!(name: Faker::Company.name) }

# Tạo Employee
50.times {
  company = Company.all.sample
  Employee.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: company
  )
}