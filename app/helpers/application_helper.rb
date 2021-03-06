module ApplicationHelper
  ADMIN_TYPES = ['AdminUser']

  def admin?(user)
    ADMIN_TYPES.include? user.try(:type)
  end

  def active?(path)
    'active' if current_page?(path)
  end

  def label_status(status)
    status_span_generator status
  end

  private
  def status_span_generator(status)
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'approved'
      content_tag(:span, status.titleize, class: 'label label-success')
    when 'rejected'
      content_tag(:span, status.titleize, class: 'label label-danger')
    when 'pending'
      content_tag(:span, status.titleize, class: 'label label-primary')
    when 'confirmed'
      content_tag(:span, status.titleize, class: 'label label-success')
    end
  end
end
