Rails.application.routes.draw do
  root "home#top"
  get "/help", to: "home#help"
  get "/liga", to: "home#liga"
  get "/bundesu", to: "home#bundesu"
  get "/premier", to: "home#premier"
  get "/serie", to: "home#serie"
  get "/league_one", to: "home#league_one"
  get "/premera", to: "home#premera"
  get "/euro", to: "home#euro"
  get "/nations_league", to: "home#nations_league"
  get "/signup", to: "users#signup"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
end
