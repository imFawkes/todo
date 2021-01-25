require 'rails_helper'

RSpec.describe Subtasks::Destroy do
  let(:current_user) { create(:user) }
  let(:task) { create(:task, user: current_user) }
  let(:subtask) { create(:subtask, task: task) }
  let(:result) { Subtasks::Destroy.new.call(params, current_user) }

  context 'when params does not have task id' do
    let(:params) { ActionController::Parameters.new }

    it 'should return "Task not found" error' do
    expect(result.success?).to eq false
    expect(result.errors).to eq(['Task not found'])
    expect(result.object).to eq nil
    end
  end

  context 'when params have incorrect task id' do
    let(:params) { ActionController::Parameters.new(task_id: '-1') }

    it 'should return "Task not found" error' do
    expect(result.success?).to eq false
    expect(result.errors).to eq(['Task not found'])
    expect(result.object).to eq nil
    end
  end

  context 'when params have task id and does not have subtask id' do
    let(:params) { ActionController::Parameters.new(task_id: task.id) }


    it 'should return "Subtask not found" error' do
    expect(result.success?).to eq false
    expect(result.errors).to eq(['Subtask not found'])
    expect(result.object).to eq nil
    end
  end

  context 'when params have task id and have incorrect subtask id' do
    let(:params) { ActionController::Parameters.new(task_id: task.id, id: '-1') }


    it 'should return "Subtask not found" error' do
    expect(result.success?).to eq false
    expect(result.errors).to eq(['Subtask not found'])
    expect(result.object).to eq nil
    end
  end

  context 'when params have correct task id and correct subtask id' do
    let(:params) { ActionController::Parameters.new(task_id: task.id, id: subtask.id) }

    it 'should destroy subtask' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).to eq(subtask)
    end
  end
end