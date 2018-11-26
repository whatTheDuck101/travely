Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :listings, only: [:index] do
    resources :requests, only: [:create, :update]
  end

  resources :stops, only: [:create]

  resources :items, only: [:new, :create]

  delete '/items/:id', to: 'items#destroy', as: "delete_item"

  get '/dashboard', to: 'pages#dashboard'
end
