class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  ADMIN_TYPES =['AdminUser']

  def admin?
    ADMIN_TYPES.include?(current_user.try(:type))
  end

  private

  def user_not_authorized
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
