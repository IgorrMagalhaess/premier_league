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

   describe '#hiring?' do
      it 'return no if the team is not hiring' do
         man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)

         expect(man_city.hiring?).to eq("No")
      end

      it 'return yes if the team is hiring' do
         man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: true)

         expect(man_city.hiring?).to eq("Yes")
      end
   end
end