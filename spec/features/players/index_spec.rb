require 'rails_helper'

RSpec.describe 'the players show page', type: :feature do
   it 'displays the player name' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      
      visit "/players"

      expect(page).to have_content(ederson.name)
   end

   it 'displays the player position' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      
      visit "/players"

      expect(page).to have_content(ederson.position)
   end

   it 'has a link to the teams index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
      tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)

      visit "/players/#{ederson.id}"

      click_on "Teams Index", match: :first

      expect(page).to have_content("Teams Index")
      expect(page).to have_content(man_city.name)
      expect(page).to have_content(liverpool.name)
      expect(page).to have_content(tottenham.name)
   end
end