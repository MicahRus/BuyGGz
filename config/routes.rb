Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :games
  resources :carts, only: [:index, :create, :destroy]
  resources :cart_items, only: [:destroy]
  resources :wishlists, only: [:index, :create, :destroy]
  resources :wishlist_items, only: [:destroy]

# stripe
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  get '/:username', to: 'users#show', as: :username
  
  root to: "users#index"
end
