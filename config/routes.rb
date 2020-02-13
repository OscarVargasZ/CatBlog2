Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get '/solicitudes', to: 'solicitudes#index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
