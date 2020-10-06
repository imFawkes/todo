require 'rails_helper'

describe Lists::Create do
  let(:result) { described_class.new.call(params) }

  context 'when no user_id in params' do
    let(:params) { {} }

    it 'raise NotFoundError and not create List' do
      expect(result).to raise_error
    end
  end

  context 'when user_id present in params' do
    let(:params) { { user_id: 1, name: 'asdasd' } }

    it 'create List' do
      expect(result.success?).to be true
      expect(result.object.name).to be('asdasd')
      expect(result.object.name).to be('asdasd')
    end
  end

  context 'when name not present in params' do
    let(:params) { { user_id: 1, name: 'asdasd' } }

    it 'not creates with validation error' do
      expect(result.success?).to be true
      expect(result.object.name).to be('asdasd')
    end
  end
end
