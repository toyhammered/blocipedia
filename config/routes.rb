Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources :wikis
  resources :users, only: [:show]
  resources :charges, only: [:new, :create]

end
