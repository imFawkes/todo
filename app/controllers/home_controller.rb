class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    # @user.role == "admin" ? render "show_admin" : render "show"
    if @user.role == "user"
      render "index"
    elsif @user.role == "admin"
      render "index_admin"
    end
  end

end
