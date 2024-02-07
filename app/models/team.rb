class Team < ApplicationRecord
   has_many :players, dependent: :destroy
   validates_presence_of :name

   def self.ordered_teams
      order(created_at: :desc)
   end

   def hiring?
      self.hiring_players ? "Yes" : "No"
   end

   def self.search_teams(name)
      where("name ILIKE ?", "%#{name}%")
   end

   def self.sort_teams(type)
      type == "alpha" ? Team.order(name: :asc) : all
   end
end