class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    # @user.role == "admin" ? render "index_admin" : render "index" # don't working
    if @user.user?
      @user = User.includes(tasks: [:lists, :subtasks], lists: [:tasks]).find(current_user[:id])
      render 'index', locals: { user: @user }
    elsif @user.admin?
      render 'index_admin', locals: { user: @user }
    end
  end

  # def index
  #   @user = current_user
  #   # @user.role == "admin" ? render "index_admin" : render "index" # don't working
  #   if @user.role.downcase == 'user'
  #     @user = User.includes(tasks: [:lists, :subtasks], lists: [:tasks]).find(current_user[:id])
  #     render 'index', locals: { user: @user }
  #   elsif @user.role.downcase == 'admin'
  #     render 'index_admin', locals: { user: @user }
  #   end
  # end
end
