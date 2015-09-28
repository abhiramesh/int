class Candidate < ActiveRecord::Base

	belongs_to :firm
	belongs_to :profile
	
end
