require 'rails_helper'

RSpec.describe Lists::Show do
  let(:current_user) { create(:user) }
  let(:list) { create(:list, user: current_user) }
  let(:result) { Lists::Show.new.call(params, current_user) }
  
  context 'when params do not have list id' do
    let(:params) { ActionController::Parameters.new }
    
    it 'should not find list and return "List not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['List not found'])
      expect(result.object).to eq nil
    end
  end

  context 'when params have incorrect list id' do
    let(:params) { ActionController::Parameters.new(id: '-1') }

    it 'should not find list and return "List not found" error' do
      expect(result.success?).to eq false
      expect(result.errors).to eq(['List not found'])
      expect(result.object).to eq nil
    end
  end
  
  context 'when params have correct list id' do
    let(:params) { ActionController::Parameters.new(id: list.id) }

    it 'should return list' do
      expect(result.success?).to eq true
      expect(result.errors).to eq([])
      expect(result.object).to eq(list)
    end
  end
end