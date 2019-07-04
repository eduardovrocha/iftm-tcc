class Devise::PasswordsController < DeviseController

  prepend_before_action :require_no_authentication

  # GET /resource/password/new
  def new
    self.resource = resource_class.new
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?
    if successfully_sent?(resource)
      redirect_to new_user_session_path
      set_flash_messages(notice: 'We send to your email some instructions', kind: 'success', tittle: 'Success')
    else
      redirect_back(fallback_location: root_path, notice: 'We do not find the associated User')
    end
  end

end