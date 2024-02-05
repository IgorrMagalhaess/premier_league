class PlayersController < ApplicationController
   def index
      players = Player.all
      @players = Player.order(created_at: :desc).where(injuried: false)
   end

   def show
      @player = Player.find(params[:id])
   end

   def new

   end

   def create 
      player = Player.create(player_params)

      redirect_to "/players"
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
      params.permit(:name, :position, :jersey_number, :injuried)
   end
end