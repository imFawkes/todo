class TasksController < ApplicationController
  def create
    result = Tasks::Create.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
      render 'home/reload_column_center', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
      render 'home/reload_column_center', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def change_list
    result = Tasks::ChangeList.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
      render 'home/reload_column_center', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def show_subtasks
    user = User.find_by(id: params[:user_id])
    task = user.tasks.find_by(id: params[:task_id])
    render 'home/reload_column_right', formats: :js, locals: { user: current_user, task: task }
  end
end
