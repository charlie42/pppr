class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_filter :set_locale
  # [...]
  def set_locale
    I18n.locale = :ru
  end

  protect_from_forgery with: :exception
  before_action :authenticate_doctor!

  protect_from_forgery

  def after_sign_in_path_for(resource)
    doctor_path(current_doctor.id) #your path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.rails_admin_path, :alert => exception.message
  end

end