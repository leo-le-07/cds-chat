Rails.application.routes.draw do
  resources :conversations
  resources :users
  resources :incoming_messages, only: [:index]
  resources :session, only: [:create, :index]
  get 'login' => 'session#new'
  get 'logout' => 'session#destroy'
  get 'signup' => 'users#new'

  root 'incoming_messages#index'
end
