Rails.application.routes.draw do
  resources :field_experiences
  resources :users do 
    resources :field_experiences
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site#index'

  get '/about', to: 'site#about'
end
