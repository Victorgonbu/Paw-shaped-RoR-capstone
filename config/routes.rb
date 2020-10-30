Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show, :destroy]

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :paws, only: [:create]
    resources :votes, only: [:create]
  end
  root 'categories#index'
end
