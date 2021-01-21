class Subtasks::Create
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:task_id])

    if task == nil
      return Result.new(false, ['Task not found'], nil)
    end

    subtask = task.subtasks.new(subtask_params(params))
    
    if subtask.save
      Result.new(true, [], subtask)
    else
      Result.new(false, subtask.errors, subtask)
    end
  end

  private

  def subtask_params(params)
    params.require(:subtask).permit(:content)
  end
end
