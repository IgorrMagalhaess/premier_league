require 'rails_helper'

RSpec.describe "Teams index page", type: :feature do
   it "can see all the teams names" do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

      visit "/teams"

      expect(page).to have_content(man_city.name)
   end
end