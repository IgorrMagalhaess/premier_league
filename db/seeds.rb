# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)

ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

salah = liverpool.players.create!(name: "Mohamed Salah", position: "Forward", jersey_number: 11, injuried: false)
alisson = liverpool.players.create!(name: "Alisson Becker", position: "Goalkeeper", jersey_number: 1, injuried: false)

son = tottenham.players.create!(name: "Son Heung-min", position: "Forward", jersey_number: 7, injuried: false)
richarlison = tottenham.players.create!(name: "Richarlison", position: "Striker", jersey_number: 9, injuried: false)