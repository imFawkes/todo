class ListsController < ApplicationController
  #  в createm destroy
  # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с lists
  # + для render eager load чтоб загрузить колонку

  def create
    result = Lists::Create.new(params, current_user).call

    if result.success?
      user = User.includes(:lists).find_by(id: current_user[:id])
      render 'home/reload_column_left', locals: { user: user, list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Lists::Destroy.new(params, current_user).call

    if result.success?
      user = User.includes(:lists).find_by(id: current_user[:id])
      render 'home/reload_column_left', locals: { user: user, list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
