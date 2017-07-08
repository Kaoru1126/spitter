Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  resources :tweets, only: [:index, :new, :create] do
    collection do
      get 'moment'
    end
  end

  resources :users, only: :show
  resources :relations, only: [:index, :create, :destroy]

end
