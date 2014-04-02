Nifty::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  namespace :admin do
    resources :products, only: :index
  end
  # resources :nifty, only: [:new, :create]
end
