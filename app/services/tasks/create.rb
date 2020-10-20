class Tasks::Create
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

    task = user.tasks.new(task_params)
    if task.save
      Result.new(true, [], task)
    else
      Result.new(false, task.errors, task)
    end
  end

  private

  def task_params
    @params.require(:task).permit(:content)
  end
end
