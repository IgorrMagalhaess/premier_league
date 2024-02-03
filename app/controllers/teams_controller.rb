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

   def create
      teams = Team.new({
         name: params[:name],
         champ_position: params[:position],
         state: params[:state],
         hiring_players: params[:on_market]
         })
      
      teams.save
      
      redirect_to '/teams'
   end

   def edit
      @team = Team.find(params[:id])
   end

   def update
      team = Team.find(params[:id])

      team.update({
         name: params[:name],
         champ_position: params[:position],
         state: params[:state],
         hiring_players: params[:on_market]
        })

      team.save

      redirect_to "/teams/#{team.id}"
    end
end