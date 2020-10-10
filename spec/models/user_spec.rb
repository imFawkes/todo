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
      it { is_expected.to validate_presence_of(:email) }
      #and what about others?
      # password_length = 6..128
      # email_regexp = /\A[^@\s]+@[^@\s]+\z/
      #maybe exsist more?
    end

  end
end
