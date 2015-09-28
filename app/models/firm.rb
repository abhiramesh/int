class Firm < ActiveRecord::Base

	has_many :candidates
	has_many :profiles, through: :candidates


end
