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

   it 'has a link to the players index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams/#{man_city.id}"

      click_on "Players Index", match: :first

      expect(page).to have_content(ederson.name)
      expect(page).to have_content(de_bruyne.name)
   end
   
   it 'shows the count of players associated to that team' do
      man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams/#{man_city.id}"

      expect(page).to have_content("Players: 2")
   end

   it 'has a link to the teams index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
      tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)

      visit "/teams/#{man_city.id}"

      click_on "Teams Index", match: :first

      expect(page).to have_content("Teams Index")
      expect(page).to have_content(man_city.name)
      expect(page).to have_content(liverpool.name)
      expect(page).to have_content(tottenham.name)
   end

   it 'has a link to the teams index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams/#{man_city.id}"

      click_on "Players"

      expect(page).to have_content(man_city.name)
      expect(page).to have_content(ederson.name)
      expect(page).to have_content(de_bruyne.name)
   end

   # As a visitor
   # When I visit a parent show page
   # Then I see a link to update the parent "Update Parent"
   # When I click the link "Update Parent"
   # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
   # When I fill out the form with updated information
   # And I click the button to submit the form
   # Then a `PATCH` request is sent to '/parents/:id',
   # the parent's info is updated,
   # and I am redirected to the Parent's Show page where I see the parent's updated info
   it 'has a link to update that team' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams/#{man_city.id}"

      expect(page).to have_button("Edit Team")
   end
end