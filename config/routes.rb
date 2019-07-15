Rails.application.routes.draw do

	post 'auth/logout', as: 'logout'
  match 'auth/login', as: 'login', via: [:get, :post]
  match 'auth/register', as: 'register', via: [:get, :post]
  resources :transactions
  post 'accounts/:id/operation', to: 'accounts#operation', as: 'accounts_operation'
  get 'users/accounts', to: 'users#accounts'
  root 'main#index', as: 'main_index'
  resources :accounts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
