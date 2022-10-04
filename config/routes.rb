Rails.application.routes.draw do
  resources :foods, only: %i[index new create destroy]
  devise_for :users
  root 'foods#index'
end
