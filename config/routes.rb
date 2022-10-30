Rottenpotatoes::Application.routes.draw do
  resources :animals
  resources :breeders
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
