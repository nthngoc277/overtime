class HomeController < ApplicationController
  def index
    if admin?
      @pending_approvals = Post.submitted.includes(:user)
      @recent_audit_items = AuditLog.includes(:user).last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end
end
