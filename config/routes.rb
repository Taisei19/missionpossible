Rails.application.routes.draw do
  root "missions#index"
  devise_for :users
  resources :users, only: [:show]
  resources :missions, only: [:index, :create, :new]
  
end
