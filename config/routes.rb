require 'sidekiq/web'

Rails.application.routes.draw do
  resources :cnab_uploads
  resources :cnab_entries, only: [:index]
  resources :stores, only: [:index, :show]
  get 'home/index'
  devise_for :users
  root to: 'home#index' # ou a página que você quiser
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  # root "posts#index"
end
