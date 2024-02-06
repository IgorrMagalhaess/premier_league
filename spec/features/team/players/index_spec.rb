require 'rails_helper'

RSpec.describe 'Team Players page', type: :feature do
   before(:each) do
      @man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      @ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      @de_bruyne = @man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
   end

   it 'can see all the players associated with that parent' do
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content(@ederson.name)
      expect(page).to have_content(@de_bruyne.name)
   end

   it 'can see the players associated with that parents attributes' do
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content(@ederson.position)
      expect(page).to have_content("Injuried: No")
      expect(page).to have_content(@ederson.jersey_number)


      expect(page).to have_content(@de_bruyne.position)
      expect(page).to have_content("Injuried: No")
      expect(page).to have_content(@de_bruyne.jersey_number)
   end

   it 'has a link to the players index' do
      liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
      salah = liverpool.players.create!(name: "Mohamed Salah", position: "Forward", jersey_number: 11, injuried: false)
      alisson = liverpool.players.create!(name: "Alisson Becker", position: "Goalkeeper", jersey_number: 1, injuried: false)
      
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content('Players Index')

      click_on "Players Index", match: :first

      expect(page).to have_content("Players Index")
      expect(page).to have_content(salah.name)
      expect(page).to have_content(alisson.name)
   end

   it 'has a link to the teams index' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
      tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)

      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content('Teams Index')

      click_on "Teams Index", match: :first

      expect(page).to have_content("Teams Index")
      expect(page).to have_content(man_city.name)
      expect(page).to have_content(liverpool.name)
      expect(page).to have_content(tottenham.name)
   end

   it 'has a link to sort the players alphabetically' do
      haaland = @man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_link('Sort Alphabetically')

      click_on "Sort Alphabetically"

      this = @ederson.name
      that = haaland.name

      expect(this).to appear_before(that)
   end

   it 'has a selector to filter players by position' do
      haaland = @man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

      visit "/teams/#{@man_city.id}/players"

      select("Forward", from: "Select Position")

      click_on "Filter Players by Position"

      expect(page).to have_content(haaland.name)
      expect(page).to_not have_content(@ederson.name)
      expect(page).to_not have_content(@de_bruyne.name)
   end

   it 'has link to Add players to the team' do
      visit "/teams/#{@man_city.id}/players"

      click_on "Add Player to #{@man_city.name}"

      expect(page).to have_content("Add Player to #{@man_city.name}")
      expect(page).to have_content("Player Name:")
      expect(page).to have_content("Player Position:")
      expect(page).to have_content("Jersey Number:")
      expect(page).to have_content("Injuried:")
      expect(page).to have_button("Add Player")
   end
end
