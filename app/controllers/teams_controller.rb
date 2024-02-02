class TeamsController < ApplicationController
   def index
      @teams = Team.ordered_teams
   end

   def show
      @team = Team.find(params[:id])
   end
end