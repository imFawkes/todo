class Subtasks::Create
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

    subtask = task.subtasks.new(subtask_params)
    if subtask.save
      Result.new(true, [], subtask)
    else
      Result.new(false, subtask.errors, subtask)
    end
  end

  private

  def subtask_params
    @params.require(:subtask).permit(:content)
  end
end