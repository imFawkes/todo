class TasksController < ApplicationController
  def create
    result = Tasks::Create.new(params).call
    task = result.object #
    user = result.user #
    if result.success?
      respond_to do |format|
        format.html { redirect_to root_path, notice: result.error_text }
        format.js { render 'show', locals: { user: user, task: task } }
      end
    else
      redirect_to root_path, alert: result.error_text
    end

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
