class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    # @user.role == "admin" ? render "show_admin" : render "show"
    if @user.role == "user"
      @user = User.includes(tasks: [:lists, :subtasks], lists: [:tasks]).find(current_user[:id])
      render "index"
    elsif @user.role == "admin"
      render "index_admin"
    end
  end

end
