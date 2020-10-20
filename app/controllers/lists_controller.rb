class ListsController < ApplicationController
  def create
    result = Lists::Create.new(params, current_user).call

    if result.success?
      redirect_to root_path
      # render 'create', locals: { user: current_user, list: result.object } # no js temlate yet
    else
      redirect_to root_path, alert: result.errors
    end
  end

  def destroy
    result = Lists::Destroy.new(params, current_user).call

    if result.success?
      redirect_to root_path
      # render 'destroy', formats: :js, locals: { user: current_user } # no js temlate yet
    else
      redirect_to root_path, alert: result.errors
    end
  end
end
