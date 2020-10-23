require 'rails_helper'

RSpec.describe Task, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:list).optional }
    it { is_expected.to have_many(:subtasks).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
