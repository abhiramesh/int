class FirmsController < ApplicationController

	before_filter :auth, :only => :admin_dash
	before_filter :authenticate_user!, :except => :apply

	def auth
    	authenticate_or_request_with_http_basic('Administration') do |username, password|
      		username == 'admin' && password == 'tenderoffer'
    	end
  	end
  	

	def apply
		@firm = Firm.find_by_name(params[:name])
	end

	def admin_dash
		@firm = Firm.find_by_name(params[:name])
		if params["position"]
			@positions = params["position"].split(', ')
			@candidates = @firm.candidates.where("position IN (:pos) ", pos: @positions)
		else
			@candidates = @firm.candidates
		end
	end

	def dash_filter
		if params["position"]
			redirect_to admin_dash_path(name: "apollo", position: params["position"].map{|e| e[0]}.join(", "))
		else
			redirect_to :back
		end
	end


	private
		def firm_params
			params.require(:firm).permit(:name)
		end


end
