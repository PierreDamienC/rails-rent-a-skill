# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "creating users..."
User.destroy_all
p "Creating skills..."
Skill.destroy_all

# 1) create users
user1 = User.create(email: "josephine@gmail.com", first_name: "josephine", last_name: "gerard", password: "azerty")
user2 = User.create(email: "jean@gmail.com", first_name: "Jean", last_name: "jerome", password: "azerty")
user3 = User.create(email: "bernard@gmail.com", first_name: "Bernard", last_name: "jp", password: "azerty")
# 2) create skills
Skill.create(name: "footballer", description: "Passsement de jambes", price: 30, user: user1)
Skill.create(name: "Basket", description: "Tirreur à 3 points", price: 50, user: user2)
Skill.create(name: "mathématiques", description: "équations du second dégré", price: 50, user: user3)

# 3) create reservations
