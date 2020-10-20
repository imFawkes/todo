class Tasks::ChangeList
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
    unless task
      return Result.new(false, ['Task not found'], nil) 
    end

    list = user.lists.find_by(id: @params[:task][:list_id])
    unless list
      return Result.new(false, ['List not found'], nil) 
    end

    task.list = list
    if task.save
      Result.new(true, [], task)
    else
      Result.new(false, task.errors, task)
    end
  end
end
