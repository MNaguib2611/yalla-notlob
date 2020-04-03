Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
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
  patch '/invitations/:invitation', to: 'user_invitations#update', as: 'update_invitation_status'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
