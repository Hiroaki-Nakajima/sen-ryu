Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:new, :create, :destroy, :show]
end
