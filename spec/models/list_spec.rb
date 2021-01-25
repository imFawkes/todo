require 'rails_helper'

RSpec.describe List, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }
    # how to make it works?
    # it { should validate_uniqueness_of(:name).scoped_to(:user).case_insensitive }
  end
end
