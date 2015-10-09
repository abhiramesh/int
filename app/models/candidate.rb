class Candidate < ActiveRecord::Base

	belongs_to :firm
	belongs_to :profile

	require "csv"

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names + ["Name","School","Year","Major","Resume","GPA"]
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names) + [product.profile.user.full_name, product.profile.school, product.profile.year, product.profile.major, product.profile.resume, product.profile.gpa]
	    end
	  end
	end
	
end
