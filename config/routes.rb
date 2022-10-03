Rails.application.routes.draw do
  resources :foods
  devise_for :users
  get 'user/index'
  root 'user#index'
end
