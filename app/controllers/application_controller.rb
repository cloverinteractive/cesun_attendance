class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Acl9::AccessDenied, :with => :unauthorized_access

  def after_sign_in_path_for(resource)
    edit_user_registration_path
  end

  protected
  def unauthorized_access
    flash[:info] = t 'messages.unauthorized_access'
    return redirect_to new_user_session_path
  end
end