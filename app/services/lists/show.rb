class Lists::Show
  Result = Struct.new(:success?, :errors, :object)

  def call(params, current_user)
    list = current_user.lists.find_by(id: params[:id])

    if list != nil
      Result.new(true, [], list)
    elsif list == nil
      Result.new(false, ['List not found'], nil)
    end
  end
end
