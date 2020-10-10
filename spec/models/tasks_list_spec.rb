require 'rails_helper'

RSpec.describe TasksList, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:task) }
    it { is_expected.to belong_to(:list) }
  end

  context 'AcitveRecord validations' do
    # The best way to fix this is to provide the matcher with a record where any required attributes are filled in with valid values beforehand.
    # https://github.com/thoughtbot/shoulda-matchers/blob/master/lib/shoulda/matchers/active_record/validate_uniqueness_of_matcher.rb
    # How???

    # no. way.
    # let(:user) { User.create(username: "F", password: "123456", email: "examplef@example.com") }
    # let(:list) { user.lists.create(id: '1', name: 'Work') }
    # let(:task) { user.tasks.create(id: '1', content: 'Check uniqueness') }
    # user
    # list
    # task

    # user = User.create(username: "F", password: "123456", email: "examplef@example.com")
    # list = user.lists.create(id: '1', name: 'Work')
    # task = user.tasks.create(id: '1', content: 'Check uniqueness')
    # subject { TasksList.new(list_id: '1', task_id: '1') }

    it { is_expected.to validate_uniqueness_of(:task_id) }
  end
end
