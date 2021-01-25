require 'rails_helper'

RSpec.describe Tasks::Destroy do
  let(:current_user) { create(:user) }
  let(:task) { create(:task, user: current_user) }
  let(:result) { Tasks::Destroy.new.call(params, current_user) }
  
  context 'when params do not have task id' do
    let(:params) { ActionController::Parameters.new }
    
    it 'should not destroy task and return "Task not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['Task not found'])
      expect(result.object).to eq nil
    end
  end

  context 'when params have incorrect task id' do
    let(:params) { ActionController::Parameters.new(id: '-1') }

    it 'should not destroy task and return "Task not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['Task not found'])
      expect(result.object).to eq nil
    end
  end
  
  context 'when params have correct task id' do
    let(:params) { ActionController::Parameters.new(id: task.id) }

    it 'should destroy task' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).to eq(task)
    end
  end
end