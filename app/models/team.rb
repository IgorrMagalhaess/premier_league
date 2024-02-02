class Team < ActiveRecord::Base
   has_many :players

   def self.ordered_teams
      order(created_at: :desc)
   end
end