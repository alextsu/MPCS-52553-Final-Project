#Purpose: Serve as controller to universities, allowing for the viewing and creation of university objects

class UniversitiesController < ApplicationController
    

    #Before filter checks for pressence of location
    before_action :find_university, :only => [:show, :edit, :update, :destroy]
    

    #Check if university id in parameter is present
    def find_university
        @university = University.find_by(id: params["id"])
    end
    

    #Display Universities
    def index

        #Handle university search. Query all universities with city names containing the inputted keyword. @universities thus contains an array of university IDs
        if params["keyword"].present?
            @universities = University.where("name LIKE ?", "%#{params["keyword"]}")

        #Handle paginations past the first page manually. When user wants to view past first 100, call the database to display the next 100 by using the offset method. Set @universities.
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @universities = University.limit(100).offset((params["page"].to_i - 1) * 100)

        #If not searching and not past first page, just display the first 100 universities
        else
            @page = 2
            @universities = University.limit(100)
        end

        @universities = @universities.order('name asc')
        @university_count = @universities.count
    end
    

    #Create new university by passing in all requisite fields from form and setting a new University object to the inputted parameters. 
    def create
        @locations = Location.limit(2000)
        @university = University.new
        @university.name = params[:name]
        @university.description = params[:description]
        @university.logo_url = params[:logo_url]
        @university.location_id = Location.find_by(:city => params[:location]).id
        if @university.save
            redirect_to universities_url, notice: "New university added."
        else
            render "new"
        end
    end
    

    #Present the details of a university when user selects one from index
    def show
        @university = University.find_by(id: params[:id])
        @users =  User.where(university_id: params[:id]).order('name')
        if @university == nil
            redirect_to universities_url, notice: "University not found."
        end
    end


     #Allow for creation of new university
    def new
        @locations = Location.limit(2000)
        @university = University.new
        render "new"
    end
    

    #We've elected to remove edit, update, and delete functionality of universities by users. We feel that, while this is part of the Golden 7, users should not have this power.
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
end
