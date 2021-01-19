class Subtasks::Create
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:task_id])
    subtask = task.subtasks.new(subtask_params(params))
    
    if subtask.save
      Result.new(true, [])
    else
      Result.new(false, subtask.errors)
    end
  end

  private

  def subtask_params(params)
    params.require(:subtask).permit(:content)
  end
end
