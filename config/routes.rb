Rails.application.routes.draw do
  get 'leaderboard/index'
  resources :chess_games
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "leaderboard#index"
end
