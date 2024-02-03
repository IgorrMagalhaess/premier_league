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

   # As a visitor
   # When I visit the parent index,
   # I see that records are ordered by most recently created first
   # And next to each of the records I see when it was created
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

    # As a visitor
   # When I visit any page on the site
   # Then I see a link at the top of the page that takes me to the Child Index

   it 'has a link to the players index' do
      visit "/teams"

      click_on "Players Index"

      expect(page).to have_content("Players Index")
   end
end