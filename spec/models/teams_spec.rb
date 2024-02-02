require "rails_helper"

describe Team, type: :model do
   describe "relationships" do
      it { should have_many(:players)}
   end

   describe '#ordered_teams' do
      it 'return the teams in descendent order by creation' do
         man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
         liverpool = Team.create!(name: "Liverpool FC", state: "Liverpool", champ_position: 5, hiring_players: true)
         tottenham = Team.create!(name: "Tottenham Hotspur FC", state: "Tottenham", champ_position: 8, hiring_players: true)

         expect(Team.ordered_teams).to eq([tottenham, liverpool, man_city])
      end
   end
end