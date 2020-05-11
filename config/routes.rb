Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  resources :games, only: [:show]
  root to: "users#index"
end
