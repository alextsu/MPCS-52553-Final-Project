class LocationsController < ApplicationController
    
    before_action :find_location, :only => [:show, :edit, :update, :destroy]
    
    def find_location
        @location = Location.find_by(id: params["id"])
    end
    
    def index
        if params["keyword"].present?
            @locations = Location.where("city LIKE '%#{params["keyword"]}%' OR state LIKE '%#{params["keyword"]}%'")
        else
            @locations = Location.all
            @locations = Location.order('city asc')
        end
    end
    
    def create
        @location = Location.new
        @location.city = params[:city]
        @location.state = params[:state]
        if @location.save
            redirect_to locations_url, notice: "Added New Location."
        else
            render "new"
        end
    end

    def show
        cookies["location_id"] = @location.id
        @location = Location.find_by(id: params[:id])
        @users =  User.where(location_id: params[:id]).order('name')
        if @location == nil
            redirect_to locations_url, notice: "Location not found."
        end
    end
    
    def edit
    end
    
    def new
        cookies.delete("location_id")
        @location = Location.new
        render "new"
    end
    
    def update
        @location.city = params[:city]
        @location.state = params[:state]
        if @location.save
            redirect_to location_url, notice: "Edited Location."
        else
            render "edit"
        end
    end
    
    def destroy
        @location.delete
        redirect_to locations_url
    end
    
end
