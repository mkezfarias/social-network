Rails.application.routes.draw do
  get 'pages/feed'
  get '/users', to: 'users#index'
  get '/profile/:id', to: 'users#show', as: :user
  get '/friends', to: 'friendships#index'
  get '/friendships', to: 'friendships#create', as: :friendships
  

  resources :likes, only: %i[create destroy]
  resources :friendships, only: %i[destroy update]
  resources :posts, only: %i[create show] do
    resources :comments, only: %i[create destroy]
  end

  devise_for :users
  root 'pages#feed'
end
