Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games
  resources :carts, only: [:index, :create]

# stripe
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"

  get '/:username', to: 'users#show', as: :username
  root to: "users#index"
end
