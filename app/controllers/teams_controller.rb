class TeamsController < ApplicationController
   def index
      @teams = Team.all
   end

   def show
      @task = Task.find(params[:id])
   end
end