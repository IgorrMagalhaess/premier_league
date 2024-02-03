require "rails_helper"

describe Player, type: :model do
   describe "relationships" do
      it { should belong_to(:team)}
   end

   describe "#count" do
      it "count the number of players" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

         expect(Player.player_count).to eq(2)
      end
   end
end