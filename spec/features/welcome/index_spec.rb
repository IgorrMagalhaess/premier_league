require 'rails_helper'

RSpec.describe "Premier League index page", type: :feature do
   it "can see a link to team index" do
      visit "/"

      expect(page).to have_link 'Teams Index'
   end

   it "can see a link to player index" do
      visit "/"

      expect(page).to have_link 'Players Index'
   end

   it "can see a link to new team" do
      visit "/"

      expect(page).to have_link 'Add New Team'
   end
end