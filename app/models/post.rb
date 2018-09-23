class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_hours
  validates :overtime_hours, numericality: { greater_than: 0.0 }

  scope :posts_by, ->(user) { where(user_id: user.id) }

  def self.posts_displayed_for(user)
    user.try(:type) == 'AdminUser' ? Post.all : Post.posts_by(user)
  end

  after_save :confirm_audit_log

  private
  def confirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date..7.days.ago)).last
    audit_log.confirmed! if audit_log.present?
  end
end
