class TasksController < ApplicationController
    # в create, destroy, change_list
    # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с tasks
    # + для render eager load чтоб загрузить колонку


  def create
    result = Tasks::Create.new(params, current_user).call
    
    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', formats: :js, locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Tasks::Destroy.new(params, current_user).call

    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', formats: :js, locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def change_list
    result = Tasks::ChangeList.new(params, current_user).call

    if result.success?
      user = User.includes(:tasks, :lists).find_by(id: current_user[:id])
      render 'home/reload_column_center', formats: :js, locals: { user: user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end


  # а тут и объект нормально отдаем
  # и eager load в service
  # так получилось, что тут отрисовка и логика совпали
  def show_subtasks
    result = Tasks::ShowSubtasks.new(params, current_user).call

    if result.success?
      render 'home/reload_column_right', formats: :js, locals: { user: current_user, task: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
