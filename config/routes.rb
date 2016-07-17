Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :friendships
  resources :messages, only: [:create]
  resources :conversations
  resources :users
  resources :session, only: [:create, :index]
  resources :conversation_emails, only: [:new, :create]
  match 'auth/:provider/callback', to: 'users#create_by_facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  get 'login' => 'session#new'
  get 'logout' => 'session#destroy'
  get 'signup' => 'users#new'

  root 'conversations#index'
end
