Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :listings, only: [:index, :new, :create] do
    resources :requests, only: [:create, :update]
  end

  get '/dashboard', to: 'pages#dashboard'
end
