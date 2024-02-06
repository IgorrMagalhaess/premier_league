class Player < ApplicationRecord
   belongs_to :team

   def self.player_count
      count
   end

   def self.ordered_players
      order(created_at: :desc)
   end

   def self.not_injuried
      where(injuried: false)
   end

   def injuried?
      injuried ? "Yes" : "No"
   end

   def self.available_positions
      @players = self.distinct.pluck(:position)
      @all_positions = @players.uniq
   end

   def self.sort_players(type)
      type == "alpha" ? Player.order(name: :ASC) : all
   end

   def self.filter_players(selected_position)
      where(position: selected_position)
   end

   def self.search_players(name)
      where("name ILIKE ?", "%#{name}%")
   end
end