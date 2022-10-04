Rails.application.routes.draw do
  resources :foods, only: %i[index new create destroy]
  devise_for :users
  root 'foods#index'
  resources :recipes, only: [:index, :show, :destroy]
  resources :foods, only: [:index, :show, :destroy]
end
