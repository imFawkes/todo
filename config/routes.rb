Rails.application.routes.draw do
    
  devise_for :users, path: ""
  
  root "home#show"

  resources :users do
    resources :tasks, only: [:create, :destroy] do
      resources :subtasks,  only: [:create, :destroy]
      member do
        post "/create_tasks_list", to: "tasks_lists#create"
        patch "/update_tasks_list", to: "tasks_lists#update"
        put "/update_tasks_list", to: "tasks_lists#update"
        delete "/destroy_tasks_list", to: "tasks_lists#destroy"  
      end
    end
    resources :lists, only: [:create, :destroy]
  end
end
