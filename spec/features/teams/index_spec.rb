require 'rails_helper'

RSpec.describe "Teams index page", type: :feature do
   it "can see all the teams names" do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

      visit "/teams"

      expect(page).to have_content(man_city.name)
   end

   # before :each do
   #    @man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
   #    @liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)

   # end

   # describe "#index" do
   #    it 'returns the teams ordered by most recently created first' do
   #       expect()
   #    end
   # end
end