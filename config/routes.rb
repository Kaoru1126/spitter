Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  resources :tweets, only: [:index, :new, :create] do
    collection do
      get 'moment'
    end
  end

  resources :users, only: [:show, ] do
    collection do
      get 'following'
    end
  end

  resources :relations, only: [:index, :create, :destroy]
  
end
