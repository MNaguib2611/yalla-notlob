Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :groups
  resources :users
  resources :tests
  post 'groups/:group_id/add', to: 'groups#addFriendToGroup', as: 'add_friend_group'
  get 'groups/:group_id/details', to: 'groups#groupDetails', as: 'group_details'
  put 'orders/:orderId/status', to: 'orders#updateStatus', as: 'update_state'
  delete 'groups/:group_id/delete/:user_id', to: 'groups#removeFriendFromGroup', as: 'delete_friend_from_group'
  root 'users#index'
  get 'friends/index', to: 'friends#index' ,:as => :friends
  post 'orders/checkInvitedExistance', to: 'orders#checkInvitedExistance', :as => 'checkInvitedExistance'

  post 'friends/create', to: 'friends#create' 
  delete 'friends/destroy', to: 'friends#destroy' 
  get 'friends/new', to: 'friends#new' 
  get 'friends/show', to: 'friends#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
