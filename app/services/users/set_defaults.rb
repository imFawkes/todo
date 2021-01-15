class Users::SetDefaults
  def call(user_id)
    user = User.find_by(id: user_id)
    user.role = :user
    user.save
    user.lists.create(name: "Unsorted service", isDefault: true)
  end
end