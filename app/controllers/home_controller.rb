class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    # @user.role == "admin" ? render "show_admin" : render "show"
    if @user.role == "user"
      render "show"
    elsif @user.role == "admin"
      render "show_admin"
    end
  end

end
