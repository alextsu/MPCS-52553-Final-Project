# In accordance with the Honor Code at UChicago, 
# I wish to specify that code in the following file was referenced or copied from a 3rd party source.
# This source, RailsCast, provided example code on how to integrate authentication and email features into existing apps
# "#274 Remember Me & Reset Password." RailsCasts. N.p., 11 July 2011. Web. 30 May 2015. <http://railscasts.com/episodes/274-remember-me-reset-password>.

class PasswordResetsController < ApplicationController

	def show
	end

    #Get the user associated with email and call the send_password_reset method if user exists
	def create
		user = User.find_by_email(params[:email])

		user.send_password_reset if user
		redirect_to root_url, :notice => "If the inputted email belongs to a user, an email has been sent with password reset instructions."

	end

    #Get the user associated with a generated password reset token
	def edit
		@user = User.find_by_password_reset_token!(params[:id])
	end

    #Find a user based on his/her password reset token and update a user's password 
	def update

        #Find the user by password reset token
		@user = User.find_by(:password_reset_token => params[:id])
		
        #If he/she entered the same password and password confirmation
		if params[:password] == params[:password_confirmation]

			puts(@user.name);

            #Set his/her password to this new param
			@user.password = params[:password]

            #If its too old, don't save
            if @user.password_reset_sent_at < 1.hours.ago
                redirect_to root_url, :notice => "This password reset request has expired."
			#Otherwise save
            elsif @user.save 
				redirect_to root_url, :notice => "Password has been reset!"
            else
				render :edit
			end

		else
            #Display a message if passwords don't match
			flash[:notice] = "Confirmation and Password do not match."
			render :edit
		end
	end
end