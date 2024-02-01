class TeamsController < ApplicationController
   def index
      teams = Team.all
      @teams = teams.order(created_at: :desc)
   end

   def show
      @team = Team.find(params[:id])
   end
end