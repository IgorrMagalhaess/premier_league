require 'rails_helper'

RSpec.describe 'the players show page', type: :feature do
   it 'displays the player name and attributes' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      
      visit "/players"

      expect(page).to have_content(ederson.name)
      expect(page).to have_content(ederson.position)
      expect(page).to have_content(ederson.jersey_number)
      expect(page).to have_content(ederson.created_at)
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

      visit "/players/"

      click_on "Teams Index", match: :first

      expect(page).to have_content("Teams Index")
      expect(page).to have_content(man_city.name)
      expect(page).to have_content(liverpool.name)
      expect(page).to have_content(tottenham.name)
   end

   it 'has a link to edit the player' do
      man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
      haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

      visit "/players"

      expect(page).to have_link("Edit #{ederson.name}")
      expect(page).to have_link("Edit #{de_bruyne.name}")
      expect(page).to have_link("Edit #{haaland.name}")
   end
   
   it 'has a link to delete the player' do
      man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
      haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

      visit "/players"

      expect(page).to have_button("Delete")

      # save_and_open_page
      
      click_on "Delete", match: :first 

      expect(page).to_not have_content(haaland.name)
      expect(page).to_not have_content(haaland.jersey_number)
      expect(page).to have_content(ederson.name)
      expect(page).to have_content(de_bruyne.name)
      expect(page).to have_content(ederson.jersey_number)
      expect(page).to have_content(de_bruyne.jersey_number)
   end
end