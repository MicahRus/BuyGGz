Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games
  resources :carts, only: [:index, :create]

  get '/:username', to: 'users#show', as: :username
  root to: "users#index"
end
