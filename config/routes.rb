Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :groups
  resources :users
  resources :tests
  post 'groups/:group_id/add', to: 'groups#addFriendToGroup', as: 'add_friend_group'
  get 'groups/:group_id/details', to: 'groups#groupDetails', as: 'group_details'
  delete 'groups/:group_id/delete/:user_id', to: 'groups#removeFriendFromGroup', as: 'delete_friend_from_group'
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
