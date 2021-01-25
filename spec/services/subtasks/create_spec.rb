require 'rails_helper'

RSpec.describe Subtasks::Create do
  let(:current_user) { create(:user) }
  let(:task) { create(:task, user: current_user) }
  let(:result) { Subtasks::Create.new.call(params, current_user) }

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

  context 'when params have task_id and does not have subtask content' do
    let(:params) { ActionController::Parameters.new(task_id: task.id) }

    it 'should raise exeption ActionController::ParameterMissing' do
      expect { result }.to raise_exception(ActionController::ParameterMissing)
    end
  end
  
  context 'when params have task_id and  have empty subtask content' do
    let(:params) { ActionController::Parameters.new(task_id: task.id, subtask: attributes_for(:subtask, :empty_content)) }

    it 'should not create subtask' do
      expect(result.success?).to eq false
      expect(result.errors).to be_an_instance_of(ActiveModel::Errors)
      expect(result.object).to be_a_new(Subtask)
    end
  end

  context 'when params have subtask content' do
    let(:params) { ActionController::Parameters.new(task_id: task.id, subtask: attributes_for(:subtask)) }

    it 'should create subtask' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).not_to be_a_new(Subtask)
      expect(result.object.content).to eq(params[:subtask][:content])
      expect(result.object.task_id).to eq(params[:task_id])
    end
  end
end