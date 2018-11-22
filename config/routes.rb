Rails.application.routes.draw do
  get 'stop/create'
  devise_for :users
  root to: 'pages#home'

  resources :listings, only: [:index, :new, :create] do
    resources :requests, only: [:create, :update]
  end

  resources :stops, only: [:create]

  get '/dashboard', to: 'pages#dashboard'
end
