class Tasks::Destroy
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:id])

    if task == nil
      return Result.new(false, ['Task not found'], nil) 
    end

    if task.destroy
      Result.new(true, [], task)
    else
      Result.new(false, task.errors, task)
    end
  end
end