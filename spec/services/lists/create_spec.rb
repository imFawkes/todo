require 'rails_helper'

RSpec.describe Lists::Create do
  let(:current_user) { create(:user) }
  let(:result) { Lists::Create.new.call(params, current_user) }

  context 'when params does not have list name' do
    let(:params) { ActionController::Parameters.new }

    it 'should raise exeption ActionController::ParameterMissing' do
      expect { result }.to raise_exception(ActionController::ParameterMissing)
    end
  end
  
  context 'when params have empty list name' do
    let(:params) { ActionController::Parameters.new(list: attributes_for(:list, :empty_name)) }

    it 'should not create list' do
      expect(result.success?).to eq false
      expect(result.errors).to be_an_instance_of(ActiveModel::Errors)
      expect(result.object).to be_a_new(List)
    end
  end

  context 'when params have list name' do
    let(:params) { ActionController::Parameters.new(list: attributes_for(:list)) }

    it 'should create list' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).not_to be_a_new(List)
      expect(result.object.name).to eq(params[:list][:name])
    end
  end
end