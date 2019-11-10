Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :packages
  resources :members 
end
