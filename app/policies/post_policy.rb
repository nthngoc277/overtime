class PostPolicy < ApplicationPolicy
  def update?
    return true if admin?
    return true if record.user_id == user.id && !record.approved?
  end

  private
  def admin?
    admin_types.include?(user.try(:type))
  end
end
