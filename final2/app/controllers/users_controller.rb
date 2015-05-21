class UsersController < ApplicationController
    
    before_action :find_user, :only => [:show, :edit, :update, :destroy]
    
    def find_user
        @user = User.find_by(id: params["id"])
    end
    
    #get array of universities, locations, and users
    def index
        if params["keyword"].present?
            @users = User.where("name LIKE '%#{params["keyword"]}%'")
        else
            @users = User.all
            @users = User.order('name asc')
        end
        @universities = University.all
        @locations = Location.all
    end
    
    #insert new user into table based on inputted parameters. Not all paramters have been inplemented yet
    def create
        @universities = University.all
        @locations = Location.all
        
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]

        #Query the database to find the corresponding University id with the inputted name
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]

        #Query the database to find the corresponding Location id with the inputted City name
        @user.location_id = Location.find_by(:city => params[:location]).id
        
        #Set the hosting property
        hosting = params[:interested_in_hosting]
        if hosting == "hosting"
            hosting = "yes"
        else
            hosting = "no"
        end
        @user.interested_in_hosting = hosting

        hanging = params[:interested_in_hanging_out]
        if hanging == "hanging_out"
            hanging = "yes"
        else
            hanging = "no"
        end
        @user.interested_in_hanging_out = hanging
        
        #Save and redirect home
        if @user.save
            redirect_to root_url, notice: "Thanks for signing up."
        else
            render "new"
        end
    end
    
    def show
        cookies["user_id"] = @user.id
        
        if @user == nil
            redirect_to users_url, notice: "User not found."
        end
    end
    
    #Edit the parameters currently displayed
    def edit
        @universities = University.all
        @locations = Location.all
    end
    
    def new
        cookies.delete("user_id")
        @user = User.new
        @universities = University.all
        @locations = Location.all
        render "new"
    end
    
    #update the table based on parameters of page.
    def update
        @universities = University.all
        @locations = Location.all
    
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]

        #Search database for matching university id
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]
        
        #Search database for matching location id
        @user.location_id = Location.find_by(:city => params[:location]).id
        hosting = params[:interested_in_hosting]
        if hosting == "hosting"
            hosting = "yes"
        else
            hosting = "no"
        end
        @user.interested_in_hosting = hosting
        hanging = params[:interested_in_hanging_out]
        if hanging == "hanging_out"
            hanging = "yes"
        else
            hanging = "no"
        end
        @user.interested_in_hanging_out = hanging
        if @user.save
            redirect_to user_url, notice: "Successfully edited profile information."
        else
            render "edit"
        end
    end
    
    def destroy
        @user.delete
        redirect_to users_url
    end
    
end
