Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :likes, only: [:index, :create, :destroy]
  resources :dislikes, only: [:index, :create, :destroy]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  resources :users
  resources :posts
  resources :comments
end
