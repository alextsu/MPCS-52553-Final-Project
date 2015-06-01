# In accordance with the Honor Code at UChicago, 
# I wish to specify that code in the following file was referenced or copied from a 3rd party source.
# This source, RailsCast, provided example code on how to integrate authentication and email features into existing apps
# "#274 Remember Me & Reset Password." RailsCasts. N.p., 11 July 2011. Web. 30 May 2015. <http://railscasts.com/episodes/274-remember-me-reset-password>.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Helper method to access current user from cookie
  def current_user
  	@current_user = User.find_by(:id => cookies["user_id"])
  end
end
