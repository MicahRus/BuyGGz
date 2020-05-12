Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games
  root to: "users#index"
end
