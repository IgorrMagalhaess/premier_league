require 'rails_helper'

RSpec.describe "Premier League index page", type: :feature do
   it "can see a link to team index" do
      visit "/"

      expect(page).to have_link 'Teams Index'

      click_on "Teams Index", match: :first

      expect(current_path).to eq("/teams")
   end

   it "can see a link to player index" do
      visit "/"

      expect(page).to have_link 'Players Index'

      click_on "Players Index", match: :first

      expect(current_path).to eq("/players")
   end

   it "can see a link to new team" do
      visit "/"

      expect(page).to have_link 'Add New Team'

      click_on "Add New Team"

      expect(current_path).to eq("/teams/new")
   end
end