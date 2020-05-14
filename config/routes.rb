Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games
  resources :carts, only: [:index, :create, :destroy]

# stripe
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  get '/:username', to: 'users#show', as: :username
  
  root to: "users#index"
end
