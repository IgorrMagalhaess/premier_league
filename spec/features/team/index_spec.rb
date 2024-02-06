require 'rails_helper'

RSpec.describe "Teams index page", type: :feature do
   before :each do
      @man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      @liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
      @tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)
   end
   
   it "can see all the teams names" do
      visit "/teams"

      expect(page).to have_content(@man_city.name)
      expect(page).to have_content(@liverpool.name)
      expect(page).to have_content(@tottenham.name)
   end

   it 'show teams ordered by most recent' do
      visit "/teams"

      this = @tottenham.name
      that = @man_city.name

      expect(this).to appear_before(that)
   end

   it "can see when all the teams were created" do
      visit "/teams"

      expect(page).to have_content(@man_city.created_at)
      expect(page).to have_content(@liverpool.created_at)
      expect(page).to have_content(@tottenham.created_at)
   end

   it 'has a link to the players index' do
      ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      de_bruyne = @man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

      visit "/teams"

      click_on "Players Index", match: :first

      expect(page).to have_content("Players Index")
      expect(page).to have_content(ederson.name)
      expect(page).to have_content(de_bruyne.name)
   end

   it 'has a link to create a new Team record' do
      visit '/teams'

      click_on "New Team", match: :first

      expect(page).to have_button 'Add Team'
      expect(page).to have_content 'New Team'
      expect(page).to have_content 'Name:'
      expect(page).to have_content 'State:'
      expect(page).to have_content 'Position:'
      expect(page).to have_content 'Hiring:'
   end

   it 'has a link to edit the Team record' do
      visit '/teams'

      click_on "Edit", match: :first

      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Name:'
      expect(page).to have_content 'State:'
      expect(page).to have_content 'Position:'
      expect(page).to have_content 'Hiring:'
      expect(page).to have_button 'Update Team'
   end

   it 'has a link to delete the Team record' do
      visit '/teams'

      click_on "Delete", match: :first

      expect(page).to_not have_content(@tottenham.name)
      expect(page).to_not have_content("Premier League Position: 8")
      expect(page).to have_content(@liverpool.name)
      expect(page).to have_content(@man_city.name)
      expect(page).to have_content("Premier League Teams")
   end
end