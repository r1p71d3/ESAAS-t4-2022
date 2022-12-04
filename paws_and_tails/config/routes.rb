Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  get '/breeders/redesigned_destroy/:id', to: "breeders#redesigned_destroy"
  get '/animals/redesigned_destroy/:id', to: "animals#redesigned_destroy"

  # get "/link", to: "users#link_user_with_breeder"

  # get 'animal/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "animals#index"
  resources :animals
  resources :breeders

  post "/animals/api/sort_location", to: "animals#sort_location"

  # get "/animals", to: "animals#index"
  # get "/animals/:id", to: "animals#show"
end
