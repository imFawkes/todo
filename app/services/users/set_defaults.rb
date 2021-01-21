class Users::SetDefaults
  def call(user_id)
    user = User.find_by(id: user_id)

    if user != nil
      user.role = :user
      user.save
      user.lists.create(name: "Unsorted", is_default: true)
    end
  end
end