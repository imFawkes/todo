class HomeController < ApplicationController
  def index
    user = current_user
    if user.user?
      user = User.includes(lists: [tasks: [:user]]).find_by(id: current_user[:id])
      unsorted_list = user.lists.find_by(name: "Unsorted")
      render 'index', locals: { user: user, unsorted_list: unsorted_list }
    elsif user.admin?
      render 'admin/index_admin', locals: { user: user }
    end
  end
end