class Team::PlayersController < ApplicationController
   def index
      @team = Team.find(params[:id])
      @players = @team.players
      @available_positions = @players.available_positions
      
      if params[:sort]
         @players = @players.sort_players(params[:sort])
      elsif params[:selected_position]
         @players = @players.filter_players(params[:selected_position])
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

private
   def player_params
      params.permit(:name, :position, :jersey_number, :injuried, :team_id)
   end
end