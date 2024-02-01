require 'rails_helper'

RSpec.describe 'Team Players page' do
   before(:each) do
      @man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      @ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      @de_bruyne = @man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
   end

   it 'can see all the players associated with that parent with each childs attributes' do
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content(@ederson.name)
      expect(page).to have_content(@de_bruyne.name)
   end
end
