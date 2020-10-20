class TasksController < ApplicationController
  def create
    result = Tasks::Create.new(params, current_user).call

    if result.success?
      render 'create', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new(params, current_user).call

    if result.success?
      render 'destroy', formats: :js, locals: { user: current_user }
      # redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def change_list
    result = Tasks::ChangeList.new(params, current_user).call

    if result.success?
      render 'reload_tasks', formats: :js, locals: { user: current_user, task: result.object }
      # redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
