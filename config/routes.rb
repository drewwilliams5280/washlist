Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :list, only: [:new, :create]
  resources :dashboard, only: [:index]
  resources :session, only: [:create]
  resources :trucks
  get '/logout', to: 'session#destroy'
end
