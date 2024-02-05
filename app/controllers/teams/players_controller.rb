class Teams::PlayersController < ApplicationController
   def index
      @team = Team.find(params[:id])
   end

   def new
      @team = Team.find(params[:id])
   end

   def create
      @team = Team.find(params[:id])
      @team.players.create(player_params)

      redirect_to "/teams/#{@team.id}/players"
   end

   def sort
      @team = Team.find(params[:id])
      @players = @team.players.order(:name)
      render :index
    end
    

   def player_params
      params.permit(:name, :position, :jersey_number, :injuried, :team_id)
   end
end