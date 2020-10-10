require 'rails_helper'

RSpec.describe Subtask, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:task) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
