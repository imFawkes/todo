require 'rails_helper'

RSpec.describe Users::SetDefaults do
  let(:user) { create(:user) }
  
  context 'when user id passed' do
    before(:each) { Users::SetDefaults.new.call(user.id) }

    it 'should set user role to "user"' do
      expect(user.reload.role).to eq('user')
    end

    let(:list) { user.lists.find_by(name: "Unsorted") }

    it 'should create default "Unsorted" list for user' do
      expect(list).not_to eq nil
      expect(list.is_default).to eq true
    end
  end
end