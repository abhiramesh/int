class FirmsController < ApplicationController

	before_filter :auth, :only => [:admin_dash, :download_book, :dash_filter]
	before_filter :authenticate_user!, :except => [:apply, :admin_dash, :download_book, :dash_filter]

	require 'combine_pdf'

	def auth
    	authenticate_or_request_with_http_basic('Administration') do |username, password|
      		username == 'admin' && password == 'tenderoffer'
    	end
  	end


	def apply
		@firm = Firm.find_by_name(params[:name])
		@minimum_password_length = 8
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

	def download_book
		@firm = Firm.find(params[:firm_id])
		@candidates = @firm.candidates

		pdf = CombinePDF.new
		@candidates.each do |candidate|
			if candidate.profile.resume
				pdf << CombinePDF.parse(Net::HTTP.get(URI.parse(candidate.profile.resume)))
			end
		end
		send_data pdf.to_pdf, filename: "combined_resume_book.pdf", type: "application/pdf"
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
