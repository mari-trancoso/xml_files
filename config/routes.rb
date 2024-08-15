require 'sidekiq/web'

Rails.application.routes.draw do
  resources :documents
  devise_for :users, skip: :omniauth_callbacks,
  controllers: {
   registrations: "users/registrations",
   confirmations: "users/confirmations",
   passwords: "users/passwords",
   sessions: "users/sessions",
   unlocks: "users/unlocks"
 }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  mount Sidekiq::Web => '/sidekiq' # mount Sidekiq::Web in your Rails app
end
