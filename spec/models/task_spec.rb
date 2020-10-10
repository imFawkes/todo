require 'rails_helper'

RSpec.describe Task, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:subtasks).dependent(:destroy) }
    it { is_expected.to have_many(:tasks_lists).dependent(:destroy) }
    it { is_expected.to have_many(:lists) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
