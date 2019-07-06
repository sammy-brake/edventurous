Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :index]
  resources :field_experiences, only: [:show, :index, :new, :create, :destroy] do 
    resources :bookings, only: [:new, :show, :index]
  end 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site#index'

  
  get '/signin', to: 'session#signin'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/signup', to: 'users#new'
  get '/auth/facebook/callback' => 'users#facebook'
  resources :users, only: [:new, :create, :show]
end
