require 'rails_helper'

RSpec.describe User, type: :model do

  context "username validation" do
    user = User.new(email: "example@example.ru", password: "123456")

    it "should not save user w/o username" do
      user.username = ""

      expect(user.save).to be false
    end

    it "should not save user with username > 30 symbols" do
      user.username = "x" * 31

      expect(user.save).to be false
    end

    it "should save user w/o username" do
      user.username = "Tom Marvolo Riddle"

      expect(user.save).to be true
    end
  end

end
