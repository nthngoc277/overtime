class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end
end
