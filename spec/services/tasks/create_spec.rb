require 'rails_helper'

describe Tasks::Create, 'which returns result (:success?, :errors, :object)' do
  let(:current_user) { User.create(id: 1, username: 'Current User', password: '123456', email: 'currentuser@mail.ru') }
  let(:result) { Tasks::Create.new(params, current_user).call }
  
  
  context 'when user not found' do
    let(:params) { ActionController::Parameters.new(user_id: 2, task: {content: 'a nu da kontent'}) }
    
    it 'should return (false, ["User not found"], nil) ' do
      expect(result.success?).to be(false)
      expect(result.errors).to eq(['User not found'])
      expect(result.object).to be(nil)
      end
  end

  context 'when user is not current user' do
    let!(:user) { User.create(id: 2, username: 'User', password: '123456', email: 'user@mail.ru') }
    let(:params) { ActionController::Parameters.new(user_id: 2, task: {content: 'a nu da kontent'}) }

    it 'should return (false, ["No access error"], nil)' do
      expect(result.success?).to be(false)
      expect(result.errors).to eq(['No access error'])
      expect(result.object).to be(nil)
    end
  end

  context 'when user is current_user but task not saved' do
    let(:params) { ActionController::Parameters.new(user_id: 1, task: {content: ''}) }
    # why next code
    # let(:params) { ActionController::Parameters.new(user_id: 1) }
    # return ActionController::ParameterMissing: param is missing or the value is empty: task

    it 'should return (false, task.errors, task)' do
      expect(result.success?).to be(false)
      expect(result.errors).to be_an_instance_of(ActiveModel::Errors)
      expect(result.object).to be_an_instance_of(Task)
      # is it needed to check that task is not saved? and how if it is?
    end
  end

  context 'when user is current_user and task saved' do
    let(:params) { ActionController::Parameters.new(user_id: 1, task: {content: 'a nu da kontent'}) }

    it 'should return (true, [], task)' do
      expect(result.success?).to be(true)
      expect(result.errors).to eq([])
      expect(result.object).to be_an_instance_of(Task)
      # is it needed to check that task is saved? and how if it is?
    end
  end

  # а надо ли проверять что пропустил params require permit а что нет?
end