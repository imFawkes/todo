class Lists::Create
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    list = current_user.lists.new(list_params(params))
    
    if list.save
      Result.new(true, [])
    else
      Result.new(false, list.errors)
    end
  end

  private

  def list_params(params)
    params.require(:list).permit(:name)
  end
end

