require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  describe 'creation' do
    it 'can be properly created' do
      audit_log = FactoryGirl.build_stubbed(:audit_log)
      expect(audit_log).to be_valid
    end
  end

  describe 'validations' do
    before do
      @audit_log = FactoryGirl.build_stubbed(:audit_log)
    end

    it 'requires to have a user association' do
      @audit_log.user_id = nil
      expect(@audit_log).not_to be_valid
    end

    it 'always have a status' do
      @audit_log.status = nil
      expect(@audit_log).not_to be_valid
    end

    it 'requires to have a start_date' do
      @audit_log.start_date = nil
      expect(@audit_log).not_to be_valid
    end

    it 'has a start_date equal to 6 days prior' do
      audit_log = AuditLog.new
      expect(audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end
