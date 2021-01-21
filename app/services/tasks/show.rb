class Tasks::Show
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    task = current_user.tasks.find_by(id: params[:id])

    if task != nil
      Result.new(true, [], task)
    elsif task == nil
      Result.new(false, ['Task not found'], nil)
    end
  end
end
