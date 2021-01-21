class TasksController < ApplicationController
  def show
    result = Tasks::Show.new.call(params, current_user)
  
    if result.success?
      render partial: 'tasks/show.js', locals: { task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def create
    result = Tasks::Create.new.call(params, current_user)

    if result.success?
      render partial: 'tasks/create.js', locals: { task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new.call(params, current_user)

    if result.success?
      render partial: 'tasks/destroy.js', locals: { task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  #likely this action should be part of 'edit' action
  def change_list
    result = Tasks::ChangeList.new.call(params, current_user)

    if result.success?
      render partial: 'tasks/change_list.js', locals: { task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
