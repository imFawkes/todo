class Tasks::Destroy
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:id])

    if task == nil
      return Result.new(false, ['Task not found'], nil) 
    end

    if task.destroy
      Result.new(true, [])
    else
      Result.new(false, task.errors)
    end
  end
end