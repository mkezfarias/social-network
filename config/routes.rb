Rails.application.routes.draw do
  get 'post/new'
  get 'post/index'
  get '/users', to: 'user#index'
  get '/friends', to: 'friendships#index'
  resources :friendships, only: %i[destroy update]
  get '/friendships', to: 'friendships#create', as: :friendships
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post#index'
end
