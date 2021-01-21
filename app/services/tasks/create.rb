class Tasks::Create
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    task = current_user.tasks.new(task_params(params))
    
    if task.save
      Result.new(true, [], task)
    else
      Result.new(false, task.errors, task)
    end
  end

  private

  def task_params(params)
    params.require(:task).permit(:content, :list_id)
  end
end

