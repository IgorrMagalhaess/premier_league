class Player < ApplicationRecord
   belongs_to :team

   def self.player_count
      self.count
   end

   def self.ordered_players
      self.order(created_at: :desc)
   end

   def self.not_injuried
      self.where(injuried: false)
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