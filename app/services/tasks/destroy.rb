class Tasks::Destroy
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

    task = user.tasks.find_by(id: @params[:id])
    unless task
      return Result.new(false, ['Task not found'], nil) 
    end

    if task.destroy
      Result.new(true, [], nil)
    else
      Result.new(false, task.errors, task) # а такие могут быть?
    end
  end

  private

  def task_params
    @params.require(:task).permit(:content)
  end
end