Rails.application.routes.draw do
  root "users#index"

  devise_for :users

  resources :posts
  resources :users, only: [:index, :show]

  post 'users/:id/block', to: 'users#block', as: 'block_user'
end
