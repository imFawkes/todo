Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index" #temp
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
