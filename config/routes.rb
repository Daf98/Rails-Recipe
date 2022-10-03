Rails.application.routes.draw do
  devise_for :users
  get 'user/index'
  root 'user#index'
end
