Rails.application.routes.draw do
    
  devise_for :users, path: ""
  
  root "home#index"

  # resources :users do #alternative if user routes needed
  scope '/users/:user_id', as: 'user' do
    resources :tasks, only: [:create, :destroy] do
      resources :subtasks,  only: [:create, :destroy]
      get 'show_subtasks'
      match 'change_list', via: [:patch, :put]
    end
    resources :lists, only: [:create, :destroy]
  end
end
