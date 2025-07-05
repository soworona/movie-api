Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  post 'movies/:id/create_comment', to: 'movies#create_comment'
  post 'movies/:id/create_rating', to: 'movies#create_rating'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
