class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  add_flash_types :success, :warning, :danger, :info

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    logger.info exception
    respond_to do |format|
      logger.info 'format: ' + format.to_s
      format.html do
        redirect_to root_path
      end

      format.json do
        render json: { success: false, message: 'Access Denied: ' + exception.message }, status: 401
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :type, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :type, :email, :password, :current_password) }
  end
end
