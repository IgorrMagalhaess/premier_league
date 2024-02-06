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

   def self.available_positions
      @players = self.distinct.pluck(:position)
      @all_positions = @players.uniq
   end

   def self.sort_players(type)
      type == "alpha" ? Player.order(name: :ASC) : all
   end

   def self.filter_players(selected_position)
      self.where(position: selected_position)
   end
end