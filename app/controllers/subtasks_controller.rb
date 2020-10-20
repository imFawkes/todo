class SubtasksController < ApplicationController
  def create
    result = Subtasks::Create.new(params, current_user).call

    if result.success?
      redirect_to root_path
      # render 'create', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Subtasks::Destroy.new(params, current_user).call

    if result.success?
      redirect_to root_path
      # render 'destroy', formats: :js, locals: { user: current_user }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
