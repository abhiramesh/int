class Profile < ActiveRecord::Base

	#attr_accessible :image, :resume, :school, :major, :year
	
	belongs_to :user

	has_many :profiletags
	has_many :tags, through: :profiletags

	has_many :candidates
	has_many :firms, through: :candidates

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names)
	    end
	  end
	end

end
