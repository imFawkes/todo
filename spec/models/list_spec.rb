require 'rails_helper'

RSpec.describe List, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tasks_lists).dependent(:destroy) }
    it { is_expected.to have_many(:tasks) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
  end
end
