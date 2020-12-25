Rails.application.routes.draw do
  root "home#top"
  get "/help", to: "home#help"
  get "/column", to: "home#column"
  get "/laliga_index", to: "laliga_posts#laliga_index"
  get "laliga_new", to: "laliga_posts#laliga_new"
  get "/bundesu_index", to: "home#bundesu_index"
  get "/premier_index", to: "home#premier_index"
  get "/serie_index", to: "home#serie_index"
  get "/league_one_index", to: "home#league_one_index"
  get "/premera_index", to: "home#premera_index"
  get "/euro_index", to: "home#euro_index"
  get "/nations_league_index", to: "home#nations_league_index"

  get "/signup", to: "users#signup"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :account_activations, only: [:edit]
  resources :laliga_posts, only: [:laliga_index, :laliga_new, :laliga_create]
  resources :bundesu_posts, only: [:bundesu_index, :bundesu_new, :bundesu_create]
  resources :premier_posts, only: [:premier_index, :premier_new, :premier_create]
  resources :serie_posts, only: [:serie_index, :serie_new, :serie_create]
  resources :league_one_posts, only: [:league_one_index, :league_one_new, :league_one_create]
  resources :premera_posts, only: [:premera_index, :premera_new, :premera_create]
  resources :euro_posts, only: [:euro_index, :euro_new, :euro_create]
  resources :nations_league_posts, only: [:nations_league_index, :nations_league_new, :nations_league_create]
end
