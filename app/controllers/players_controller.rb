class PlayersController < ApplicationController
   def index
      if params[:search]
         @players = @players.search_players(params[:search])
      elsif
         @players = Player.sort_players(params[:sort])
      else
         @players = Player.ordered_players.not_injuried
      end
   end

   def show
      @player = Player.find(params[:id])
   end

   def new

   end

   def edit
      @player = Player.find(params[:id])
   end

   def update
      player = Player.find(params[:id])
      player.update(player_params)

      redirect_to "/players/#{player.id}"
   end

   def destroy
      player = Player.find(params[:id])
      player.destroy

      redirect_to "/players"
   end

private
   def player_params
      params.permit(:name, :position, :jersey_number, :injuried, :search)
   end
end