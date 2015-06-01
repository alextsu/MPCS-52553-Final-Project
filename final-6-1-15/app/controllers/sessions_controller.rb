#Purpose: Serve as controller to sessions allowing for login and logout

class SessionsController < ApplicationController

	def new
	end


	#Handle login by finding user by email, and if authentication successful, setting session and cookies hash
	def create

		#Get user by email
		user = User.find_by(email: params[:email])
		if user

			#If authentication successful, set the session and cookie
			if user.authenticate(params[:password]) 
				session["user_id"] = user.id
				cookies["user_id"] = user.id
				redirect_to root_url, notice: "Welcome!"

			#Otherwise display message unknown password
			else
				redirect_to root_url, notice: "Unknown password."
			end
		else
			redirect_to root_url, notice: "Unknown email."
		end
	end


	#Handle logout by clearing cookies and sessions
	def destroy
		cookies["user_id"] = nil
		session["user_id"] = nil
		redirect_to root_url, notice: "Logged out."
	end

end