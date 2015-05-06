class UsersController < ApplicationController

  #get array of universities, locations, and users
  def index
  	@users = User.order('email asc')
  	@universities = University.all
  	@locations = Location.all
  end

  #insert new user into table based on inputted parameters. Not all paramters have been inplemented yet
  def create
  	user = User.new
  	user.email = params[:email]
  	user.password = params[:password]

    #Query the database to find the corresponding University id with the inputted name
  	user.university_id = University.find_by(:name => params[:university]).id
  	user.graduation_year = params[:graduation_year]
  	user.major = params[:major]
  	user.bio = params[:bio]

    #Query the database to find the corresponding Location id with the inputted City name
  	user.location_id = Location.find_by(:city => params[:location]).id
  	user.interested_in_hosting = params[:interested_in_hosting]
  	user.interested_in_hanging_out = params[:interested_in_hanging_out]
  	user.save

    #redirect to homepage when done
  	redirect_to "/"
  end


  #Edit the parameters currently displayed
  def edit
  	@user = User.find_by(id: params[:id])
  	@universities = University.all
  	@locations = Location.all
  end

  #update the table based on parameters of page. Not all are implemented currently
  def update
  	user = User.find_by(id: params[:id])
  	user.email = params[:email]
  	user.password = params[:password]
  	user.university_id = University.find_by(:name => params[:university]).id
  	user.graduation_year = params[:graduation_year]
  	user.major = params[:major]
  	user.bio = params[:bio]
  	user.location_id = Location.find_by(:city => params[:location]).id
  	user.interested_in_hosting = params[:interested_in_hosting]
  	user.interested_in_hanging_out = params[:interested_in_hanging_out]
  	user.save
  	redirect_to "/"
  end

  #get the corresponding user and delete it from the db
  def destroy
  	user = User.find_by(id: params[:id])
  	user.delete
  	redirect_to "/"
  end

end