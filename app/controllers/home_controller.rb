class HomeController < ApplicationController
  def index
    @pending_approvals = Post.submitted
    @recent_audit_items = AuditLog.last(10)
  end
end
