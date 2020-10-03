class SubtasksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:task_id])
    @task.subtasks.create(subtask_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:task_id])
    @subtask = @task.subtasks.find(params[:id])
    @subtask.destroy
    redirect_to root_path
  end

  private
  def subtask_params
    params.require(:subtask).permit(:content)
  end
end
