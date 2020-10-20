class Lists::Create
  Result = Struct.new(:success?, :errors, :object)

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def call
    user = User.find_by(id: @params[:user_id])
    unless user
      return Result.new(false, ['User not found'], nil)
    end
    unless user == @current_user
      return Result.new(false, ['No access error'], nil) 
    end

    list = user.lists.new(list_params)
    if list.save
      Result.new(true, [], list)
    else
      Result.new(false, list.errors, list)
    end
  end

  private

  def list_params
    @params.require(:list).permit(:name)
  end
end
