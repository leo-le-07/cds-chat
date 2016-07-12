Rails.application.routes.draw do
  get 'login' => 'session#new'

  root 'welcome#index'
end
