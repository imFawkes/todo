class Lists::IndexTasks
  Result = Struct.new(:success?, :errors, :object)

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def call
    user = User.find_by(id: @params[:user_id])
    unless user
      return Result.new(false, ['User not found'], nil)
    end
    unless user == @current_user
      return Result.new(false, ['No access error'], nil) 
    end

    list = user.lists.find_by(id: @params[:list_id])
    if list
      # list = user.lists.includes(:tasks).find_by(id: @params[:list_id])
      Result.new(true, [], list)
    else
      Result.new(false, ['List not found'], nil) 
    end
  end
end
