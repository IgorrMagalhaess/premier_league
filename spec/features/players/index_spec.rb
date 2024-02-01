require 'rails_helper'

RSpec.describe 'the players show page', type: :feature do
   it 'displays the player name' do
      man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      
      visit "/players"

      expect(page).to have_content(ederson.name)
   end
end