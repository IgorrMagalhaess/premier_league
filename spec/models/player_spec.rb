require "rails_helper"

describe Player, type: :model do
   describe "relationships" do
      it { should belong_to(:team)}
   end

   describe "#player_count" do
      it "count the number of players" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

         expect(Player.player_count).to eq(2)
      end
   end

   describe '#ordered_players' do
      it "order players by order of creation" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: false)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)
         haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

         expect(Player.ordered_players).to eq([haaland, de_bruyne, ederson])
      end
   end

   describe '#not_injuried' do
      it "return only the players that are not injuried" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: true)
         haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

         expect(Player.not_injuried).to eq([haaland])
      end
   end

   describe '#injuried?' do
      it "return yes if the player is injuried" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

         expect(ederson.injuried?).to eq("Yes")
      end
   end

   describe '#injuried?' do
      it "return no if the player is not injuried" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: false)

         expect(de_bruyne.injuried?).to eq("No")
      end
   end

   describe '#available_positions' do
      it "return all the positions a team have" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: true)
         haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

         expect(man_city.players.available_positions).to eq(["Forward", "Goalkeeper", "Midfielder"])
      end
   end
   
   describe '#sort_players' do
      it "return players in alphabetical order" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: true)
         haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

         expect(Player.sort_players("alpha")).to eq([ederson, haaland, de_bruyne])
      end
   end

   describe '#filter_players' do
      it "return only players that are in the position passed" do
         man_city = Team.create!(name: "Manchester City FC", state: "Manchester", champ_position: 1, hiring_players: false)
         ederson = man_city.players.create!(name: "Ederson", position: "Goalkeeper", jersey_number: 31, injuried: true)
         de_bruyne = man_city.players.create!(name: "Kevin De Bruyne", position: "Midfielder", jersey_number: 17, injuried: true)
         haaland = man_city.players.create!(name: "Haaland", position: "Forward", jersey_number: 9, injuried: false)

         expect(Player.filter_players("Goalkeeper")).to eq([ederson])
      end
   end
end