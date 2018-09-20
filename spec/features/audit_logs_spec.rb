require 'rails_helper'

describe AuditLog do
  let(:audit_log) { FactoryGirl.create(:audit_log) }
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  
  before do
    login_as(admin_user, scope: :user)
  end

  describe 'index' do
    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq 200
    end

    it 'renders audit log content' do
      FactoryGirl.create(:audit_log)
      visit audit_logs_path
      expect(page).to have_content(/LASTNAME, FIRSTNAME/)
    end

    it 'cannot be accessed by non admin user' do
      logout(:admin_user)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq root_path
    end
  end
end
