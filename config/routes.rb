Rails.application.routes.draw do
  root "home#top"
  get "home/help"
  get "home/liga"
  get "home/bundesu"
  get "home/premier"
  get "home/serie"
  get "home/league_one"
  get "home/premera"
  get "home/euro"
  get "home/nations_league"
  get "users/signup"
  resources :users
end
