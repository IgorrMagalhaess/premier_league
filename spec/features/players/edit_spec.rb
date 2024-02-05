require 'rails_helper'

RSpec.describe 'Player Edit page', type: :feature do
   before (:each) do
      @man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
      @ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
   end

   it 'can edit the player' do
      visit "/players/#{@ederson.id}"

      expect(page).to have_content(@ederson.name)
      expect(page).to have_content(@ederson.position)
      expect(page).to have_content(@ederson.jersey_number)
      expect(page).to have_content("Injuried: No")

      click_link("Edit #{@ederson.name}")

      expect(current_path).to eq("/players/#{@ederson.id}/edit")

      fill_in("name", with: "Dida")
      fill_in("position", with: "Goalkeeper")
      fill_in("jersey_number", with: 1)
      fill_in("injuried", with: "true")
      click_button "Update Player"

      expect(current_path).to eq("/players/#{@ederson.id}")

      expect(page).to have_content("Dida")
      expect(page).to have_content("Goalkeeper")
      expect(page).to have_content("Injuried: Yes")
   end
end