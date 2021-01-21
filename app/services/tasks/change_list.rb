class Tasks::ChangeList
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:id])

    if task == nil
      return Result.new(false, ['Task not found'], nil) 
    end

    list = current_user.lists.find_by(id: params[:list_id])

    if list == nil
      return Result.new(false, ['List not found'], nil) 
    end

    if list.tasks << task
      Result.new(true, [], task)
    else
      Result.new(false, task.errors, task)
    end
  end
end