Rails.application.routes.draw do
  root "home#top"
  get "contacts/new"
  post "contacts/create"
  get "/column", to: "home#column"
  get "/signup", to: "users#signup"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :laliga_posts
  resources :bundesu_posts
  resources :premier_posts
  resources :serie_posts
  resources :league_one_posts
  resources :eredivisie_posts
  resources :users
  resources :account_activations, only: [:edit]
  resources :relationships, only: [:create, :destroy]
  scope "/:locale" do
    resources :books
  end
  resource :profile, only: %i[show edit update]
  resources :users, only: [:index, :show]
end
