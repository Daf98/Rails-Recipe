Rails.application.routes.draw do
  devise_for :users
  get 'user/index'
  root 'user#index'
  resources :recipes, only: [:index, :show, :destroy]
  resources :foods, only: [:index, :show, :destroy]
end
