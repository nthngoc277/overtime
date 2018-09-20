class AuditLog < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, confirmed: 1 }

  validates_presence_of :status, :start_date

  after_initialize :set_start_date

  private
  def set_start_date
    self.start_date ||= Date.today - 6.days
  end
end
