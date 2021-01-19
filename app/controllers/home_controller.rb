class HomeController < ApplicationController
  def index
    user = current_user
    if user.user?
      user = User.includes(:lists, :tasks).find(current_user[:id])
      render 'index', locals: { user: user }
    elsif user.admin?
      render 'admin/index_admin', locals: { user: user }
    end
  end
end
