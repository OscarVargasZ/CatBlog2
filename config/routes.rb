Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get '/requests', to: 'requests#index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
