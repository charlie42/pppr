class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
  before_filter :set_locale
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  # [...]
  def set_locale
    I18n.locale = :ru
  end

  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
      #flash[:error] = exception.message
      redirect_to '/', :alert => exception.message
  end

  #before_action :authenticate_doctor!
  
  def after_sign_in_path_for(resource)
    #doctor_patients_path(current_doctor.id) #your path
    if current_doctor.is? :admin
      rails_admin.dashboard_path
    else
      doctor_patients_path(current_doctor.id)
    end
  end

  

  protected

    def configure_devise_permitted_parameters
      registration_params = [:company_name, :company_address, 
        :company_code, :password]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end


end