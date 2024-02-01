require 'rails_helper'

RSpec.describe 'Team Players page' do
   before(:each) do
      @man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      @ederson = @man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
      @de_bruyne = @man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
   end

   it 'can see all the players associated with that parent' do
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content(@ederson.name)
      expect(page).to have_content(@de_bruyne.name)
   end

   it 'can see the players associated with that parents attributes' do
      visit "/teams/#{@man_city.id}/players"

      expect(page).to have_content(@ederson.position)
      expect(page).to have_content(@ederson.injuried)
      expect(page).to have_content(@ederson.jersey_number)


      expect(page).to have_content(@de_bruyne.position)
      expect(page).to have_content(@de_bruyne.injuried)
      expect(page).to have_content(@de_bruyne.jersey_number)
   end
end
