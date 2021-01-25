class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    if user.user?
      user = User.includes(tasks: [:list, :subtasks], lists: [:tasks]).find(current_user[:id])
      render 'index', locals: { user: user }
    elsif user.admin?
      render 'index_admin', locals: { user: user }
    end
  end

end
