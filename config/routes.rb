Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  #ログイン機能
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  #ユーザの新規登録 URL を /signup にしたい
  get 'signup', to: 'users#new'
  #resources で、必要なアクションだけ only: ... として指定します。
  resources :users, only: [:index, :show, :new, :create]do
    member do
      get :followings
      get :followers
      get :like_microposts
      end
  end
  
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
