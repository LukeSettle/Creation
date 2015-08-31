Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events
  resources :activities do
    put :follow
  end
  root 'events#index'
end
