Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :destroy]
  resources :categories, only: [:index, :destroy] do
    resources :posts, only: [:new, :create, :index, :destroy] do
      resources :paws, only: [:create]
      resources :votes, only: [:create]
    end
  end

  root 'categories#index'
end
