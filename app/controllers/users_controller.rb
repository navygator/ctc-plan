class UsersController < BaseController
  before_action :require_admin
  
  private
  def require_admin
    unless current_user && current_user.role == 'admin'
      redirect_to root_path, alert: 'Unauthorized'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end