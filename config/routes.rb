Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :destroy] do
    resources :paws, only: [:create, :new, :update]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show, :destroy]

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :votes, only: [:create, :destroy]
  end
  root 'categories#index'
end
