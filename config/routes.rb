Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get 'followings', 'followers'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :microposts
end
