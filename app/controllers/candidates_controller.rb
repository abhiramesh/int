class CandidatesController < ApplicationController

	def update_position
		@firm = Firm.find_by_name("apollo")
		@candidate = current_user.profile.candidates.find_by_firm_id(@firm.id)
		if params["position"]
			@candidate.position = params["position"]
			@candidate.save
		end
		redirect_to add_profile_path
	end

	private
		def candidate_params
			params.require(:candidate).permit(:profile_id, :firm_id, :position)
		end


end
