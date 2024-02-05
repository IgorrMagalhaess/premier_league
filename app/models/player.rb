class Player < ApplicationRecord
   belongs_to :team

   def self.player_count
      self.count
   end

   def injuried?
      self.injuried ? "Yes" : "No"
   end

   def self.sort_players(type)
      if type == "alpha"
         Player.order(name: :ASC)
      end
   end
end