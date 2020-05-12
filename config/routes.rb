Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games

  get '/:username', to: 'users#show', as: :username
  root to: "games#index"
end
