Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  resources :games, only: [:show, :new, :create]
  root to: "users#index"
end
