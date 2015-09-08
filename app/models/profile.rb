class Profile < ActiveRecord::Base

	#attr_accessible :image, :resume, :school, :major, :year
	
	belongs_to :user

end
