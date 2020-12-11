Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :list, only: [:new]
end
