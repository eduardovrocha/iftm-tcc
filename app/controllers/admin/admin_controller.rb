class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :check_for_authorization

  def check_for_authorization
    if current_user.role.nil? || current_user.role.ability != 'admin'
      set_flash_messages(notice: 'Access denied', kind: 'error', tittle: 'Error')
      redirect_to root_path
    end
  end

end