Rails.application.routes.draw do

  root 'sessions#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#fbcreate'
  delete '/logout' => 'sessions#destroy'
  #resources :upvotes
  #resources :posts
  resources :topics
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
