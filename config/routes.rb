Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get 'users/show'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end 
end
