class RegistrationsController < Devise::RegistrationsController

 
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end

  def create
  	if params["access_code"] == "recruit2015"
	  	super
	  	Profile.create(user_id: current_user.id)
	else
		redirect_to root_path
	end

  end

  private


end