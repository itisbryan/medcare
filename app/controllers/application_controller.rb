class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from StandardError, with: :handle_error

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  private

  def handle_error(exception)
    render json: {
      status: 400,
      message: 'There is something wrong',
      details: exception.message
    }
  end
end
