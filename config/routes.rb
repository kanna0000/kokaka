Rails.application.routes.draw do
  # resources :balances
  resources :users do
    resources :balances
  end
  resources :user_session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'
end
