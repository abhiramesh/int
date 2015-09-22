class Profile < ActiveRecord::Base

	#attr_accessible :image, :resume, :school, :major, :year
	
	belongs_to :user

	has_many :profiletags
	has_many :tags, through: :profiletags

end
