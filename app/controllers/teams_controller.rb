class TeamsController < ApplicationController
   def index
      if params[:sort]
         @teams = Team.sort_teams(params[:sort])
      elsif params[:search]
         @teams = Team.search_teams(params[:search])
      else
         @teams = Team.ordered_teams
      end
   end

   def show
      @team = Team.find(params[:id])
      @count = @team.players.player_count
   end

   def new
   end

   def create
      team = Team.create(team_params)
      
      redirect_to "/teams"
   end

   def edit
      @team = Team.find(params[:id])
   end

   def update
      team = Team.find(params[:id])

      team.update(team_params)

      redirect_to "/teams/#{team.id}"
   end

   def destroy
      Team.destroy(params[:id])

      redirect_to "/teams"
   end

private
   def team_params
      params.permit(:name, :champ_position, :state, :hiring_players)
   end
end