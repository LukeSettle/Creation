Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events do
    put :follow
  end
  resources :activities do
    put :follow
    put :unfollow
  end
  root 'events#index'
end
