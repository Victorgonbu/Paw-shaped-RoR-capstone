Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show, :destroy] do
    resources :posts, only: [:new, :create, :index, :destroy] do
      resources :paws, only: [:create]
      resources :votes, only: [:create]
    end
  end

  root 'users#new'
end
