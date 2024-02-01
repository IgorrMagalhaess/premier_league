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
end