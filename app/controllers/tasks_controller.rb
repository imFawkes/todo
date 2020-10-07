class TasksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.tasks.create(task_params)
    redirect_to root_path
  end

  # how to create simple (w/o js) form for updating task?
  # def update
  #   @user = User.find(params[:user_id])
  #   @task = @user.tasks.find(params[:id])
  #   @task.update(task_params)
  #   redirect_to user_path(@user)
  # end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
