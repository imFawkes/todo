Rails.application.routes.draw do
    
  devise_for :users, path: ""
  
  root "users#show" #temp?!

  resources :users do
    resources :tasks, only: [:create, :show, :destroy] do
      resources :subtasks,  only: [:create, :show, :destroy]
      member do
        post "/create_tasks_list", to: "tasks_lists#create"
        patch "/update_tasks_list", to: "tasks_lists#update"
        put "/update_tasks_list", to: "tasks_lists#update"
        delete "/destroy_tasks_list", to: "tasks_lists#destroy"  
      end
    end
    resources :lists, only: [:create, :show, :destroy]
  end
end
