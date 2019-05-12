Rails.application.routes.draw do
  resources :bookings, only: [:new, :create]
  resources :field_experiences, only: [:show, :index] do 
    resources :bookings, only: [:new, :create, :show, :index]
  end 
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site#index'

  get '/about', to: 'site#about'
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/signup', to: 'users#new'
  get '/auth/facebook/callback' => 'users#facebook'
end
