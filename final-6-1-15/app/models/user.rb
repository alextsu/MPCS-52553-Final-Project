# In accordance with the Honor Code at UChicago, 
# I wish to specify that code in the following file was referenced or copied from a 3rd party source.
# This source, RailsCast, provided example code on how to integrate authentication and email features into existing apps
# "#274 Remember Me & Reset Password." RailsCasts. N.p., 11 July 2011. Web. 30 May 2015. <http://railscasts.com/episodes/274-remember-me-reset-password>.

class User < ActiveRecord::Base
	has_secure_password

	#Helper method that sends the password reset via email
	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!(validate: false)
		UserMailer.password_reset(self).deliver_now
	end

	#Generates a secure random token for the above method to serve as the password_reset_token
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	has_many :event_signups, :dependent => :delete_all
	has_many :events, through: :event_signups, :dependent => :delete_all
	belongs_to :location
	belongs_to :university

	validates :email, :uniqueness => true, :allow_nil => false
	validates :password, :presence => true
	validates :graduation_year, :presence => true
	validates :major, :presence => true
	validates :location_id, :presence => true
	validates :university_id, :presence => true
end
