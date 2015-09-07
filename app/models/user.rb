class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



	def full_name
		self.firstname.strip.capitalize + " " + self.lastname.strip.capitalize
	end

end
