Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get '/request', to: 'requests#index'
  patch '/request/accept/:id', to: 'requests#accept'
  patch '/request/reject/:id', to: 'requests#reject'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
