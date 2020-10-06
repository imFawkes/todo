class Lists::Create
  Result = Struct.new(:success?, :errors, :object)

  def call(params)
    user = User.find_by(id: params[:user_id])

    if user.nil?
      Result.new(false, ['user not found'], nil)
      return
    end

    list = user.lists.new(list_params)

    if list.save!
      Result.new(true, [], list)
    else
      Result.new(false, list.errors, nil)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
