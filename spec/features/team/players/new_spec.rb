require 'rails_helper'

RSpec.describe 'New Team Player Page', type: :feature do
   before(:each) do
      @man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      @ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      @de_bruyne = @man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
   end

   it 'Add players to the team' do
      visit "/teams/#{@man_city.id}/players/new"

      expect(page).to have_content("Add Player to #{@man_city.name}")
      expect(page).to have_content("Player Name:")
      expect(page).to have_content("Player Position:")
      expect(page).to have_content("Jersey Number:")
      expect(page).to have_content("Injuried:")
      expect(page).to have_button("Add Player")

      fill_in("name", with: "Dida")
      fill_in("position", with: "Goalkeeper")
      fill_in("jersey_number", with: 1)
      fill_in("injuried", with: "false")
      click_button "Add Player"

      expect(current_path).to eq("/teams/#{@man_city.id}/players")
      expect(page).to have_content("Dida")
      expect(page).to have_content("Position: Goalkeeper")
      expect(page).to have_content("Jersey Number: 1")
      expect(page).to have_content("Injuried: No")
   end
end