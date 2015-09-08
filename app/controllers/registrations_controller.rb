class RegistrationsController < Devise::RegistrationsController

 
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end

  def create
  	super
  	Profile.create(user_id: current_user.id)
  end

  private


end