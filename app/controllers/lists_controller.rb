class ListsController < ApplicationController
  def create
    result = Lists::Create.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с lists
      render 'home/reload_column_left', locals: { user: current_user, list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Lists::Destroy.new(params, current_user).call

    if result.success?
      # result.object пока отдаем бессмысленно, т.к. перезагружается вся колонка с lists
      render 'home/reload_column_left', locals: { user: current_user, list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
