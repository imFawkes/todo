class ListsController < ApplicationController
  def show
    result = Lists::Show.new.call(params, current_user)

    if result.success?
      render partial: 'lists/show.js', locals: { list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
  
  def create
    result = Lists::Create.new.call(params, current_user)

    if result.success?
      render partial: 'lists/create.js', locals: { list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Lists::Destroy.new.call(params, current_user)

    if result.success?
      render partial: 'lists/destroy.js', locals: { list: result.object }
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
