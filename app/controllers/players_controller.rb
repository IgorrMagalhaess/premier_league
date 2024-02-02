class PlayersController < ApplicationController
   def index
      players = Player.all
      @players = Player.order(created_at: :desc)
   end

   def show
      @player = Player.find(params[:id])
   end
end