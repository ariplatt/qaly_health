class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:user_name, :disease_name, :disease_id, :date_diagnosed, :time_diagnosed, :description_of_illness])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:user_name, :disease_name, :disease_id, :date_diagnosed, :time_diagnosed, :description_of_illness])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:user_name, :patient, :patient_id, :hospital_id, :hospital_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:user_name, :patient, :patient_id, :hospital_id, :hospital_name])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:brain_oxygen_level, :time, :date, :feeling, :self_image, :user_name, :brain_pressure_level, :brain_temperature_level, :physician_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:brain_oxygen_level, :time, :date, :feeling, :self_image, :user_name, :brain_pressure_level, :brain_temperature_level, :physician_id])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:user_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:user_name])
  end
end
