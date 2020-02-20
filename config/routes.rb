Rails.application.routes.draw do
  get 'pages/feed'
  get '/users', to: 'users#index'
  get '/profile/:id', to: 'users#show', as: :user
  get '/friends', to: 'friendships#index'
  get '/friendships', to: 'friendships#create', as: :friendships
  devise_for :users, controllers: { omniauth_callbacks: 'login/omniauth_callbacks' }
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/:login/callback', to: 'sessions#create'
  get 'auth/login/callback', to: 'sessions#create'
  get '/login/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')


  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_facebook_session
  end

  resources :likes, only: %i[create destroy]
  resources :friendships, only: %i[destroy update]
  resources :posts, only: %i[create show] do
    resources :comments, only: %i[create destroy]
  end

  root 'pages#feed'
end
