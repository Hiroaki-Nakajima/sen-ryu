Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts, only: [:new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]

  resources :notifications, only: :index
end
