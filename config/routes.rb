Rails.application.routes.draw do
  resources :balances
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'
end
