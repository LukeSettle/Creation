Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events
  resources :activities
  root 'events#index'
end
