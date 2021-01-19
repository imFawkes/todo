class TasksController < ApplicationController
  def create
    result = Tasks::Create.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def show
    task = current_user.tasks.find_by(id: params[:id])
    render partial: 'tasks/show.js', locals: { task:task }
  end

  def change_list
    task = current_user.tasks.find_by(id: params[:id])
    list = current_user.lists.find_by(id: params[:list_id])

    list.tasks << task

    redirect_to root_path
  end
end
