Rails.application.routes.draw do
  # Custom routes for user authentication
  root 'home#index'
  post '/register', to: 'users#register'
  post '/login', to: 'sessions#login', as: 'login' # Added comma here
  delete '/logout', to: 'sessions#logout'

  # Endpoint for tracking website visits
  post '/track_website_visit', to: 'website_visits#create'
  post '/api/activity', to: 'activity#track'

  # Endpoint for managing restricted websites
  resources :restricted_websites, only: [:index, :create, :destroy]

  # Endpoint for managing time limits
  resources :time_limits, only: [:index, :create, :destroy]
end
