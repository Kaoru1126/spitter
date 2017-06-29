Rails.application.routes.draw do
  root 'tweets#index'
  get 'tweets' => 'tweets#index'
end
