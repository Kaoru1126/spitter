Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  resources :tweets, only: [:index, :new, :create] do
    collection do
      get 'moment'
      get 'caution'
      post 'checked'
    end
  end

  resources :users, only: [:show] do
    member do
      get 'following'
      get 'follower'
    end
  end

  resources :relations, only: [:index, :create, :destroy]

end
