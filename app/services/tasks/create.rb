class Tasks::Create
  Result = Struct.new(:success?, :error_text, :object, :user) #

  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(id: @params[:user_id])
    task = user.tasks.new(task_params)

    if task.save
      Result.new(true, 'Task created.', user.tasks.last, user) #
    else
      Result.new(false, 'Task should have content.', task, user) #
    end
  end

  private

  def task_params
    @params.require(:task).permit(:content)
  end
end
