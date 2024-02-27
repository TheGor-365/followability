Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :posts
  
  get 'users/index'
  get 'users/show'
end
