class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if:  :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  def set_flash_messages params
    flash[:notice] = params[:notice]
    flash[:kind] = params[:kind]
    flash[:tittle] = params[:tittle]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

end
