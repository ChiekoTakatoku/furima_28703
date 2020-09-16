Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    member do
      resources :orders
    end
  end
end
