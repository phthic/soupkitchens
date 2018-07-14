Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  # root to: 'static#home'


  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"

  get '/auth/:twitter/callback', to: 'sessions#create'

  resources :users
  resources :soupkitchens do
  	resources :comments
  end 
  resources :food_pantries
  
end
