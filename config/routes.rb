Nifty::Application.routes.draw do
  devise_for :users

  root to: 'home#index'
  # resources :nifty, only: [:new, :create]
end
