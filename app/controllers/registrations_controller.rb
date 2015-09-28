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
	  	profile = Profile.create(user_id: current_user.id)
	  	if params["firm_name"]
	  		Candidate.create(profile_id: profile.id, firm_id: Firm.find_by_name(params["firm_name"]).id)
	  	end
	else
		redirect_to :back
	end

  end

  private


end