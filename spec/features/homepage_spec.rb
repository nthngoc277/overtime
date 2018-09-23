require 'rails_helper'

describe 'Homepage' do
  it 'allows admin to approve pending approval' do
    post = FactoryGirl.create(:post)
    admin_user = FactoryGirl.create(:admin_user)
    login_as(admin_user, scope: :user)

    visit root_path
    click_on "approve_#{post.id}"
    expect(post.reload.status).to eq 'approved'
  end

  it 'allows owner of audit log to confirmed it' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    audit_log = AuditLog.create(user_id: user.id, status: 0, start_date: 6.days.ago)

    visit root_path
    click_on "pending-confirmation-#{audit_log.id}"

    expect(audit_log.reload.status).to eq 'confirmed'
  end
end
