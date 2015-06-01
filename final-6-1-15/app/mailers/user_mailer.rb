# In accordance with the Honor Code at UChicago, 
# I wish to specify that code in the following file was referenced or copied from a 3rd party source.
# This source, RailsCast, provided example code on how to integrate authentication and email features into existing apps
# "#274 Remember Me & Reset Password." RailsCasts. N.p., 11 July 2011. Web. 30 May 2015. <http://railscasts.com/episodes/274-remember-me-reset-password>.

class UserMailer < ApplicationMailer

	#Call the mail message by sending to inputted user's email
  	def password_reset(user)
  		@user = user
  		mail :to => user.email, :subject => "Password Reset"
	end
end