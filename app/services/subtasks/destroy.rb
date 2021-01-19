class Subtasks::Destroy
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:task_id])

    if task == nil
      return Result.new(false, ['Task not found'], nil) 
    end

    subtask = task.subtasks.find_by(id: params[:id])

    if subtask == nil
      return Result.new(false, ['Subtask not found'], nil) 
    end

    if subtask.destroy
      Result.new(true, [])
    else
      Result.new(false, subtask.errors)
    end
  end
end