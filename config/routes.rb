Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  # root to: 'static#home'


  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"
  get '/comments', to: 'comments#index', as: "comments"

  get '/auth/:provider/callback', to: 'sessions#create'
  # get '/comments/most_recently_updated', to: 'comments#
  # most_recently_updated'

  resources :users
  resources :soupkitchens do
  	resources :comments
  end 
  resources :food_pantries
  
end
