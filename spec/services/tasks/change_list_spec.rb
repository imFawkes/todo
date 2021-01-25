require 'rails_helper'

RSpec.describe Tasks::ChangeList do
  let(:current_user) { create(:user) }
  let(:list) { create(:list, user: current_user) }
  let(:task) { create(:task, user: current_user) }
  let(:result) { Tasks::ChangeList.new.call(params, current_user) }
  
  context 'when params do not have task id' do
    let(:params) { ActionController::Parameters.new }
    
    it 'should not find task and return "Task not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['Task not found'])
      expect(result.object).to eq nil
    end
  end

  context 'when params have incorrect task id' do
    let(:params) { ActionController::Parameters.new(id: '-1') }

    it 'should not find task and return "Task not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['Task not found'])
      expect(result.object).to eq nil
    end
  end

  context 'when params have task id and do not have list id' do
    let(:params) { ActionController::Parameters.new(id: task.id) }
    
    it 'should not find task and return "List not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['List not found'])
      expect(result.object).to eq nil
    end
  end

  context 'when params have task id and have incorrect list id' do
    let(:params) { ActionController::Parameters.new(id: task.id, list_id: '-1') }

    it 'should not find task and return "List not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['List not found'])
      expect(result.object).to eq nil
    end
  end
  
  context 'when params have correct task id and correct list id' do
    let(:params) { ActionController::Parameters.new(id: task.id, list_id: list.id) }

    it 'should change tasks list to given list' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object.list_id).to eq(params[:list_id])
    end
  end
end