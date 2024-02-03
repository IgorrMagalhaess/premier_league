require 'rails_helper' 

RSpec.describe 'the players show page', type: :feature do
   it 'displays the name of the player' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      
      visit "/players/#{ederson.id}"

      expect(page).to have_content(ederson.name)
   end

    # As a visitor
   # When I visit any page on the site
   # Then I see a link at the top of the page that takes me to the Child Index

   it 'has a link to the players index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/players/#{ederson.id}"

      click_on "Players Index", match: :first

      expect(page).to have_content("Players Index")
      expect(page).to have_content(ederson.name)
      expect(page).to have_content(de_bruyne.name)
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