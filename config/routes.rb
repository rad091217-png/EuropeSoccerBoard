Rails.application.routes.draw do
  root "home#top"
  get "contacts/new"
  post "contacts/create"
  get "/column", to: "home#column"
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
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :laliga_posts
  resources :users
  resources :account_activations, only: [:edit]
  resources :relationships, only: [:create, :destroy]
  scope "/:locale" do
    resources :books
  end
  resource :profile, only: %i[show edit update]
  resources :users, only: [:index, :show]
  resources :laliga_posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
end
