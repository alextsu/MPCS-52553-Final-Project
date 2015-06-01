#Purpose: Serve as controller to universities, allowing for all of the golden 7 in managing users

class UsersController < ApplicationController
    

    #Before filter checks for user login. Halt execution if not proper user present
    before_action :authorize, :only => [:edit, :update, :destroy] 
    before_action :find_user, :only => [:show, :edit, :update, :destroy]


    #Verify identity of user as event creator. Return "Nice try" if the creator id doesn't match
    def authorize
        @user = User.find_by(id: params[:id])
        if @user.blank? || session[:user_id] != @user.id
          redirect_to root_url, notice: "Nice try!"
        end
    end 
    

    #Search for user with paramter for the before filter
    def find_user
        @user = User.find_by(id: params["id"])
    end
    

    #Display users
    def index

        #Handle user name search
        if params["keyword"].present?
            @users = User.where("name LIKE ?", "%#{params["keyword"]}")

        #Handle paginations past the first page manually. When user wants to view past first 100, call the database to display the next 100 by using the offset method. 
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @users = User.limit(100).offset((params["page"].to_i - 1) * 100)
        
        #Otherwise, just display the first 100 Users
        else
            @page = 2
            @users = User.limit(100)
        end

        @users = @users.order('name asc')
        @user_count = @users.count

        #Get universities and locations for dropdown pickers. We've set an arbitrary limit at 2000.
        @universities = University.limit(2000)
        @locations = Location.limit(2000) 
    end
    

    #Create new user by passing in all requisite fields from form and setting a new User object to the inputted parameters. 
    def create
        if cookies["user_ids"].present? 
            cookies.delete("user_ids")
        end

        #Get universities and locations for dropdown pickers. We've set an arbitrary limit at 2000.
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 
        
        #Permit is used to limit mass updating
        h = params.permit(:email, :password)
        @user = User.new(h)

        #Pass in user-generated paramters from form
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]
        @user.location_id = Location.find_by(:city => params[:location]).id

        #Get the user's response and store it as yes or no for the two questions
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
            redirect_to root_url, notice: "Sign up successful."
        else
            render "new"
        end
    end
    

    #Present the details of a user when user selects one from index
    def show
        if @user == nil
            redirect_to users_url, notice: "Error. User not found."
        else 

            #If the user_id cookie is nil, set it to empty string instead. Add in id to the cookies string for use in history
            cookies["user_ids"] ||= ""
            if !cookies['user_ids'].include?(@user.id.to_s)
                cookies["user_ids"] += "#{@user.id} "
            end
        end
    end
    


    #Allow user to edit user if he/she is creator based on the before filter
    def edit
        @user = User.find_by(id: session["user_id"]) 
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 
    end


    #Allow user to create new user profile. Get universities and locations for use in dropdown.
    def new
        @user = User.new
        @universities = University.limit(2000) 
        @locations = Location.limit(2000)
        render "new"
    end
    

    #Save the newly edited user with all the parameters that the user inputted
    def update
        @user = User.find_by(id: session["user_id"]) 
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 
    
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.university_id = University.find_by(:name => params[:university]).id
        @user.graduation_year = params[:graduation_year]
        @user.major = params[:major]
        @user.bio = params[:bio]
        @user.location_id = Location.find_by(:city => params[:location]).id
        
        #As before, convert the response into yes and no strings for storage
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
            redirect_to user_url, notice: "Successfully edited profile."
        else
            render "edit"
        end
    end
    

    #Allow user to delete his/her own account. Clear history, user_id and remove user from database
    def destroy
        cookies.delete("user_id")
        cookies.delete("user_ids")
        User.find_by(id: session["user_id"]).delete 
        session.delete("user_id")
        redirect_to users_url, notice: "Your profile has been deleted."
    end
    
end
