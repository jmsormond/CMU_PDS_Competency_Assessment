class ApplicationController < ActionController::Base
  include AssessmentHelpers::Authentication
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def check_authentication
      authenticate_user
  end

end
