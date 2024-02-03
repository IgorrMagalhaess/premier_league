class TeamsController < ApplicationController
   def index
      @teams = Team.ordered_teams
   end

   def show
      @team = Team.find(params[:id])
      @count = @team.players.player_count
   end

   def new
      
   end
end