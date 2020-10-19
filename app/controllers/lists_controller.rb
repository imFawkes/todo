class ListsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    list = @user.lists.create(list_params)
    redirect_to root_path

    # ! переделать
    # creator = Lists::Create.new

    # result = creator.call(params)

    # if result.success?
    #   render json: { object: result.object.to_json, code: 200 }
    # else
    #   render json: { errors: result.errors.messages, code: 422 }
    # end
  end

  def destroy
    @user = User.find(params[:user_id])
    list = @user.lists.find(params[:id])
    list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
