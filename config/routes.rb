Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts, only: [:new, :create, :destroy, :show] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]
end
