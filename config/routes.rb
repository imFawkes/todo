Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
    
  devise_for :users, path: ""
  
  root "home#index"

  # resources :users do #alternative if user routes needed
  # scope '/users/:user_id', as: 'user' do
  #   resources :tasks, only: [:create, :destroy] do
  #     resources :subtasks,  only: [:index, :create, :destroy]
  #     match 'change_list', via: [:patch, :put]
  #   end
  #   resources :lists, only: [:create, :destroy] do
  #     get 'index_list', to: 'tasks#index_list'
  #   end
  # end

  resources :lists
  resources :tasks do
    resources :subtasks
    # match 'change_list', via: [:patch, :put]
    member do
      patch 'change_list'
      put 'change_list'
    end
  end

end
