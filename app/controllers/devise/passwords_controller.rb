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

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      redirect_to '/users/sign_in', notice: 'Now you can try access'
    else
      set_minimum_password_length
      respond_with resource
    end
  end

end