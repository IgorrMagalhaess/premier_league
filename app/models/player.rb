class Player < ApplicationRecord
   belongs_to :team

   def self.player_count
      self.count
   end
end