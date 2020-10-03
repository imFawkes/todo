class TasksListsController < ApplicationController
  # add task to list
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id]) #strong parameters?
    @list = @user.lists.find(params[:list_id]) #strong parameters?
    @task.lists << @list
    redirect_to root_path
  end

  # move task from list1 to list2
  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @tasks_list = @task.tasks_lists.find_by(task_id: params[:id])
    @tasks_list[:list_id] = params[:list_id] #strong parameters?
    @tasks_list.save
    redirect_to root_path
  end

  # extract task from list
  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @list = @user.lists.find(params[:list_id])
    @task.lists.destroy(@list)
    redirect_to root_path
  end
end
