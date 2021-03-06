class Lists::Destroy
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    list = current_user.lists.find_by(id: params[:id])

    if list == nil
      return Result.new(false, ['List not found'], nil) 
    end

    if list.destroy
      Result.new(true, [], list)
    else
      Result.new(false, list.errors, list)
    end
  end
end
