class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[user_name disease_name disease_id date_diagnosed time_diagnosed
                                               description_of_illness])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[user_name disease_name disease_id date_diagnosed time_diagnosed
                                               description_of_illness])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name user_id])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[user_name user_id])
  end
end
