require 'rails_helper'

RSpec.describe "Team index page", type: :feature do
   it "can see all the attributes of a team" do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

      visit "/teams/#{man_city.id}"

      expect(page).to have_content(man_city.name)
      expect(page).to have_content(man_city.state)
      expect(page).to have_content(man_city.champ_position)
      expect(page).to have_content(man_city.hiring_players)
   end

   it "has a link to that teams players" do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

      visit "/teams/#{man_city.id}"

      click_on "Players"

      expect(current_path).to eq("/teams/#{man_city.id}/players")
   end

   # As a visitor
   # When I visit any page on the site
   # Then I see a link at the top of the page that takes me to the Child Index

   it 'has a link to the players index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

      visit "/teams/#{man_city.id}"

      expect(page).to have_link 'Player Index'
      
      click_on "Players Index"

      expect(current_path).to eq("/players")
   end
      # User Story 7, Parent Child Count

      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent   

   it 'shows the count of players associated to that team' do
      man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams/#{man_city.id}"

      expect(page).to have_content("Players: 2")
   end
end