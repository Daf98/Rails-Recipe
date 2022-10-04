Rails.application.routes.draw do
  resources :foods, only: %i[index new create destroy]
  devise_for :users
  root 'foods#index'
  resources :recipes, only: [:index, :show, :destroy]
  get '/general_shopping_list', to: 'shopping#index', as: 'general_shopping_list'
end
