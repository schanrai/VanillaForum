Rails.application.routes.draw do

  root 'sessions#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#fbcreate'
  post '/logout' => 'sessions#destroy'
  get 'topics/:id/most_upvoted' => 'topics#most_upvoted'

  #resources :posts, only: [:delete]

  resources :topics do
    resources :posts, only: [:new, :show, :create, :edit, :update, :destroy]
  end

  resources :users do
    resources :posts, only: [:index]
  end
  #except edit and delete

  resources :upvotes, only: [:new, :create]


end
