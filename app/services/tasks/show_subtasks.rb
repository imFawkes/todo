class Tasks::ShowSubtasks
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

    task = user.tasks.find_by(id: @params[:task_id])
    if task
      task = user.tasks.includes(:subtasks).find_by(id: @params[:task_id])
      Result.new(true, [], task)
    else
      Result.new(false, ['Task not found'], nil) 
    end
  end
end
