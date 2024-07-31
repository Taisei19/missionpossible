Rails.application.routes.draw do
  root "missions#index"
  devise_for :users
  resources :users, only: [:show]
  resources :missions, only: [:index, :create, :new, :show, :destroy] do
    resources :comments, only: [:create]
  end
  resources :levels, only: [:update]do
    member do
      patch 'decrement'
    end
  end
  resources :comments, only: [:create]
end