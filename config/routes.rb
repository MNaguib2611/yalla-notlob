Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :groups
  resources :users
  resources :tests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
