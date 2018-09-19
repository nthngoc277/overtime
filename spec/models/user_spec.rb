require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    let(:user) { FactoryGirl.build_stubbed(:user) }

    it 'can be created' do
      expect(user).to be_valid
    end
  end

  describe 'validations' do
    let(:user) { FactoryGirl.build_stubbed(:user) }

    it 'cannot be created without first_name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'cannot be created without last_name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'cannot be created without phone number' do
      user.phone_number = nil
      expect(user).to_not be_valid
    end

    it 'requires phone number to only contain integer' do
      user.phone_number = 'mystring'
      expect(user).to_not be_valid
    end

    it 'requires phone number to only have 10 chars' do
      user.phone_number = '1234'
      expect(user).to_not be_valid
    end
  end

  describe 'custom name method' do
    it 'has a method that combines first_name and last_name into full_name' do
      user = FactoryGirl.build_stubbed(:user)
      expect(user.full_name).to eq("LASTNAME, FIRSTNAME")
    end
  end
end
