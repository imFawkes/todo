Rails.application.routes.draw do
    
  devise_for :users, path: ""
  
  root "users#show" #temp

    resources :users do
      resources :tasks, only: [:create, :show, :destroy] do
        resources :subtasks,  only: [:create, :show, :destroy]
        post "/add_task_list", to: "tasks_lists#add_task_list"
        patch "/change_task_list", to: "tasks_lists#change_task_list"
        put "/change_task_list", to: "tasks_lists#change_task_list"
        delete "/delete_task_list", to: "tasks_lists#delete_task_list"
      end
      resources :lists, only: [:create, :show, :destroy] do
      end
      
      
    end
end
