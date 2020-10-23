require 'rails_helper'

RSpec.describe User, type: :model do

  context 'associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
    it { is_expected.to have_many(:lists).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_most(30) }

    context 'from devise' do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_confirmation_of(:password) }
      # password_length = 6..128
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
      it { is_expected.to validate_length_of(:password).is_at_most(128) }

      it { is_expected.to validate_presence_of(:email) }
      # how to test email_regexp = /\A[^@\s]+@[^@\s]+\z/ ????
      # how to know: is it more devise validations exists?
    end

  end
end
