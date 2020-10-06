class ListsController < ApplicationController
  def create
    creator = Lists::Create.new

    result = creator.call(params)

    if result.success?
      render json: { object: result.object.to_json, code: 200 }
    else
      render json: { errors: result.errors.messages, code: 422 }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    list = @user.lists.find(params[:id])
    list.destroy
    redirect_to root_path
  end
end
