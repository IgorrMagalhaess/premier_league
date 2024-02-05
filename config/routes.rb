Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/", to: "welcome#index"

  get '/teams', to: "teams#index"
  get '/teams/new', to: "teams#new"
  post '/teams', to: "teams#create"
  get '/teams/:id', to: "teams#show"
  get '/teams/:id/edit', to: "teams#edit"
  patch '/teams/:id', to: "teams#update"
  delete '/teams/:id', to: "teams#destroy"
  
  get '/players', to: "players#index"
  get '/players/new', to: "players#new"
  post '/players', to: "players#create"
  get '/players/:id', to: "players#show"
  get '/players/:id/edit', to: "players#edit"
  patch '/players/:id', to: "players#update"
  delete '/players/:id', to: "players#destroy"

  get '/teams/:id/players', to: "team/players#index"
  get '/teams/:id/players/new', to: "team/players#new"
  post '/teams/:id/players', to: "team/players#create"
end
