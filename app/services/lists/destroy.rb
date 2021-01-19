class Lists::Destroy
  Result = Struct.new(:success?, :errors)

  def call(params, current_user)
    list = current_user.lists.find_by(id: params[:id])

    if list == nil
      return Result.new(false, ['List not found'], nil) 
    end

    if list.destroy
      Result.new(true, [])
    else
      Result.new(false, list.errors)
    end
  end
end
