class Tag < ActiveRecord::Base

	has_many :profiletags
	has_many :profiles, through: :profiletags

end
