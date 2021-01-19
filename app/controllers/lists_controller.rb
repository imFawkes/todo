class ListsController < ApplicationController
  def create
    result = Lists::Create.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Lists::Destroy.new.call(params, current_user)

    if result.success?
      redirect_to root_path
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def show
    list = current_user.lists.find_by(id: params[:id])
    render partial: 'lists/show.js', locals: { list: list }
  end
end
