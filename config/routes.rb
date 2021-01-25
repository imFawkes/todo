Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
    
  devise_for :users, path: ""
  
  root "home#index"

  resources :lists, only: [:show, :create, :destroy]
  resources :tasks, only: [:show, :create, :destroy] do
    resources :subtasks, only: [:create, :destroy]
    member do
      patch 'change_list'
      put 'change_list'
    end
  end
end