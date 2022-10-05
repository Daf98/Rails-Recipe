Rails.application.routes.draw do
  resources :foods, only: %i[index new create destroy]
  devise_for :users
  root 'foods#index'
  resources :recipes, only: [:index, :new, :create, :show, :destroy]
  resources :public_recipes, only: [:index, :destroy]
  resources :recipe_foods, only: [:new, :create, :destroy]
end
