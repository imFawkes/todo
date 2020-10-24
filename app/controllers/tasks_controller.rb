class TasksController < ApplicationController

  def index_list
    result = Lists::IndexTasks.new(params, current_user).call

    if result.success?
      render partial: 'tasks/index_list_reload', locals: { user: current_user, list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  # в create, destroy, change_list
  # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
  # + для render eager load чтоб загрузить колонку

  def create
    result = Tasks::Create.new(params, current_user).call
    
    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new(params, current_user).call

    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def change_list
    result = Tasks::ChangeList.new(params, current_user).call

    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
