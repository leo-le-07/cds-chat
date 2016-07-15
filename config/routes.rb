Rails.application.routes.draw do
  resources :friendships, only: [:new, :create, :index]
  resources :add_friends, only: [:index, :create]
  resources :conversations
  resources :users
  resources :incoming_messages, only: [:index]
  resources :session, only: [:create, :index]
  get 'login' => 'session#new'
  get 'logout' => 'session#destroy'
  get 'signup' => 'users#new'

  root 'incoming_messages#index'
end
