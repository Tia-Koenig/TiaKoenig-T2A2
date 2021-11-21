# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sample data 

User.create(email: "seed@admin.com", password: "password")
User.find_by(email: "seed@admin.com").add_role(:admin)

User.create(email: "test@test.com", password: "password")

Genset.create(set: "Base Set 1")
Genset.create(set: "Jungle")
Genset.create(set: "Fossil")
Genset.create(set: "Base Set 2")
Genset.create(set: "Team Rocket")
Genset.create(set: "Gym Heroes")
Genset.create(set: "Gym Challenge")

CardCondition.create(condition: "Mint")
CardCondition.create(condition: "Near Mint")
CardCondition.create(condition: "Lightly Played")
CardCondition.create(condition: "Moderatly Played")
CardCondition.create(condition: "Heavily Played")
CardCondition.create(condition: "Damaged")