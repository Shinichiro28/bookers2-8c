Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about' => "homes#about"
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  #ネストさせる
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  #ネストさせる
  resources :users do
    get "search", to: "users#search"
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get "search" => "searches#search"
    resources :groups do
      resource :group_users, only: [:create, :destroy]
    end
  end
