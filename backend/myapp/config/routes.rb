Rails.application.routes.draw do
  # Custom routes for user authentication
  root 'home#index'

  # Endpoint for tracking website visits
  post '/track_website_visit', to: 'website_visits#create'
  post '/api/activity', to: 'activity#track'
  devise_for :users
  # Endpoint for managing restricted websites
  resources :restricted_websites, only: [:index, :create, :destroy]

  # Endpoint for managing time limits
  resources :time_limits, only: [:index, :create, :destroy]
end
