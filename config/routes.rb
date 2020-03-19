Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #api
  namespace :api do
  	# resources :posts
    post '/posts', to: 'posts#index'
  	post 'authenticate', to: 'authentication#authenticate'
  	# resources :sessions, only: [:create]
  	resources :registrations, only: [:create]
  	# delete :logout, to: "sessions#logout"
  	# get :logged_in, to: "sessions#logged_in"
  end

  root "api/static#home"

end