class ListsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.lists.create(list_params)
    redirect_to root_path
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
