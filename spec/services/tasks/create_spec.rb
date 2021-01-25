require 'rails_helper'

RSpec.describe Tasks::Create do
  let(:current_user) { create(:user) }
  let(:result) { Tasks::Create.new.call(params, current_user) }

  context 'when params does not have task content' do
    let(:params) { ActionController::Parameters.new }

    it 'should raise exeption ActionController::ParameterMissing' do
      expect { result }.to raise_exception(ActionController::ParameterMissing)
    end
  end
  
  context 'when params have empty task content' do
    let(:params) { ActionController::Parameters.new(task: attributes_for(:task, :empty_content)) }

    it 'should not create task' do
      expect(result.success?).to eq false
      expect(result.errors).to be_an_instance_of(ActiveModel::Errors)
      expect(result.object).to be_a_new(Task)
    end
  end

  context 'when params have task content' do
    let(:params) { ActionController::Parameters.new(task: attributes_for(:task)) }

    it 'should create task' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).not_to be_a_new(Task)
      expect(result.object.content).to eq(params[:task][:content])
      expect(result.object.list_id).to eq(params[:task][:list_id])
    end
  end
end