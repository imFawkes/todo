class TasksListsController < ApplicationController
  def add_task_list
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:task_id])
    @list = @user.lists.find(params[:list_id])
    @task.lists << @list
    redirect_to user_path(@user)
  end

  def change_task_list
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:task_id])
    @tasks_list = @task.tasks_lists.find_by(task_id: params[:task_id])
    @tasks_list[:list_id] = params[:list_id]
    @tasks_list.save
    redirect_to user_path(@user)
  end

  def delete_task_list
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:task_id])
    @list = @user.lists.find(params[:list_id])
    @task.lists.destroy(@list)
    redirect_to user_path(@user)
  end
end
