Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :packages
  resources :members do
    resources :payments do
    end
  end
end
