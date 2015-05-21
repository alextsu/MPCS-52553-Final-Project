class UniversitiesController < ApplicationController
    
    before_action :find_university, :only => [:show, :edit, :update, :destroy]
    
    def find_university
        @university = University.find_by(id: params["id"])
    end
    
    def index
        if params["keyword"].present?
            @universities = University.where("name LIKE '%#{params["keyword"]}%'")
        else
            @universities = University.all
            @universities = University.order('name asc')
        end
    end
    
    def create
        @locations = Location.all 

        @university = University.new
        @university.name = params[:name]
        @university.color = params[:color]
        @university.location_id = Location.find_by(:city => params[:location]).id
        if @university.save
            redirect_to universities_url, notice: "Added New University."
        else
            render "new"
        end
    end
    
    def show
        cookies["university_id"] = @university.id
        @university = University.find_by(id: params[:id])
        @users =  User.where(university_id: params[:id]).order('name')
        if @university == nil
            redirect_to universities_url, notice: "University not found."
        end
    end
    
    def edit
        
        @locations = Location.all
    end
    
    def new
        cookies.delete("university_id")
        @university = University.new
        @locations = Location.all
        render "new"
    end
    
    def update
        @university.name = params[:name]
        @university.color = params[:color]
        @university.location_id = Location.find_by(:city => params[:location]).id
        if @university.save
            redirect_to university_url, notice: "Edited University."
        else
            render "edit"
        end
    end
    
    def destroy
        @university.delete
        redirect_to universities_url
    end
    
end
