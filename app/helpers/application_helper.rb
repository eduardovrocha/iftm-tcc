module ApplicationHelper

  def check_authorization
    if user_signed_in?
      current_user.check_role == 'admin' ? true : false
    end
  end

end