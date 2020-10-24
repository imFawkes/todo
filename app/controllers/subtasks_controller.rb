class SubtasksController < ApplicationController

  # тут ок
  def index
    result = Subtasks::Index.new(params, current_user).call

    if result.success?
      render 'home/reload_column_right', locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def create
    result = Subtasks::Create.new(params, current_user).call

    if result.success?
    # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
    # еще и task отдельно считываем
    task = current_user.tasks.find_by(id: params[:task_id])
    render 'home/reload_column_right', locals: { user: current_user, task: task }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Subtasks::Destroy.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
      # еще и task отдельно считываем
      task = current_user.tasks.find_by(id: params[:task_id]) # 
      render 'home/reload_column_right', locals: { user: current_user, task: task }
    else
      redirect_to root_path, alert: result.errors
    end
  end

end
