class Lists::Destroy
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

    list = user.lists.find_by(id: @params[:id])
    unless list
      return Result.new(false, ['List not found'], nil) 
    end
    if list.isDefault
      return Result.new(false, ['Default list can not be destroyed'], nil) 
    end


    if list.destroy
      Result.new(true, [], nil)
    else
      Result.new(false, list.errors, list) # а такие могут быть?
    end
  end

  private

  def list_params
    @params.require(:list).permit(:content)
  end
end
