class Team::PlayersController < ApplicationController
   def index
      @team = Team.find(params[:id])
      @players = @team.players

      if params[:sort]
         @players = @players.sort_players(params[:sort])
      end
   end

   def new
      @team = Team.find(params[:id])
   end

   def create
      @team = Team.find(params[:id])
      @team.players.create(player_params)

      redirect_to "/teams/#{@team.id}/players"
   end    

   def player_params
      params.permit(:name, :position, :jersey_number, :injuried, :team_id)
   end
end