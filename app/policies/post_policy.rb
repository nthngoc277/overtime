class PostPolicy < ApplicationPolicy
  def update?
    return true if admin?
    return true if record.user_id == user.id && !record.approved?
  end

  def approve?
    admin?
  end
end
