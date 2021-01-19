class Tasks::Create
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    task = current_user.tasks.new(task_params(params))
    
    if task.save
      Result.new(true, [])
    else
      Result.new(false, task.errors)
    end
  end

  private

  def task_params(params)
    params.require(:task).permit(:content)
  end
end

