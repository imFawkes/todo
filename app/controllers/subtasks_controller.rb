class SubtasksController < ApplicationController
  def create
    result = Subtasks::Create.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end
  
  def destroy
    result = Subtasks::Destroy.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
