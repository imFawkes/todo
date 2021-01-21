class SubtasksController < ApplicationController
  def create
    result = Subtasks::Create.new.call(params, current_user)

    if result.success?
      render partial: 'subtasks/create.js', locals: { subtask: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
  
  def destroy
    result = Subtasks::Destroy.new.call(params, current_user)

    if result.success?
      render partial: 'subtasks/destroy.js', locals: { subtask: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
