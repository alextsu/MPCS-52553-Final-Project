#Purpose: Serve as controller to locations, allowing for the viewing and creation of location objects

class LocationsController < ApplicationController
    
    #Before filter checks for pressence of location
    before_action :find_location, :only => [:show, :edit, :update, :destroy]
    

    #Check if location id in parameter is present
    def find_location
        @location = Location.find_by(id: params["id"])
    end
    

    #Display locations
    def index

        #Handle location search. Query all locations with city names containing the inputted keyword. @locations thus contains an array of location IDs
        if params["keyword"].present?
            @locations = Location.where("city LIKE ?", "%#{params["keyword"]}")

        #Handle paginations past the first page manually. When user wants to view past first 100, call the database to display the next 100 by using the offset method. Set @locations.
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @locations = Location.limit(100).offset((params["page"].to_i - 1) * 100)

        #If not searching and not past first page, just display the first 100 location
        else
            @page = 2
            @locations = Location.limit(100)
        end

        @locations = @locations.order('city asc')
        @location_count = @locations.count
    end
    

    #Create new location by passing in all requisite fields from form and setting a new Location object to the inputted parameters. 
    def create
        @location = Location.new
        @location.city = params[:city]
        @location.state = params[:state]
        @location.description = params[:description]
        if @location.save
            redirect_to locations_url, notice: "New location added."
        else
            render "new"
        end
    end
    

    #Present the details of a location when user selects one from index
    def show
        @location = Location.find_by(id: params[:id])
        @users =  User.where(location_id: params[:id]).order('name')
        if @location == nil
            redirect_to locations_url, notice: "Location not found."
        end
    end
    

    #Allow for creation of new location
    def new
        @location = Location.new
        render "new"
    end


    #We've elected to remove edit, update, and delete functionality of locations by users. We feel that, while this is part of the Golden 7, users should not have this power.
    def edit
    end
    


    def update
    end
    


    def destroy
    end
    
end