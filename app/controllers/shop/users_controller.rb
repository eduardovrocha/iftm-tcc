class Shop::UsersController < Shop::ShopController

  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def show
    @user_orders = Order.all
  end

  def update_info
    @user = current_user
    respond_to do |format|
      if @user.update_attributes!(name: params['user']['name'], phone: params['user']['phone'])
        format.html {redirect_to shop_user_profile_path, notice: 'Updated !'}
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end

end