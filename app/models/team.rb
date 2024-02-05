class Team < ApplicationRecord
   has_many :players, dependent: :destroy
   validates_presence_of :name

   def self.ordered_teams
      order(created_at: :desc)
   end

   def hiring?
      self.hiring_players ? "Yes" : "No"
   end

   def sort(type)
      if type == "alpha"
         Team.order(name: :ASC)
      end
   end
end