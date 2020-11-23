class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_paramater_sanitizer.permit(:sign_up, keys[:first_name, :last_name])

    devise_parameter_sanitize.permit(:account_update, keys: [:first_name, :last_name ])

  end

end
