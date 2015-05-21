class EventsController < ApplicationController
    
    before_action :find_event, :only => [:show, :edit, :update, :destroy]
    
    def find_event
        @event = Event.find_by(id: params["id"])
    end
    
    def index
        if params["keyword"].present?
            @events = Event.where("name LIKE '%#{params["keyword"]}% event.locations.city LIKE '%#{params["keyword"]}% OR event.universities.name LIKE '%#{params["keyword"]}% '")
        else
            @events = Event.all
            @events = Event.order('name asc')
        end
    end
    
    def create
        @locations = Location.all
        @universities = University.all
        @event = Event.new
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = params[:start_time]
        @event.end_time = params[:end_time]
        @event.description = params[:description]
        @event.organizer_contact_email = params[:organizer_contact_email]
        if @event.save
            redirect_to events_url, notice: "Added new event."
        else
            render "new"
        end
    end
    
    def show
        cookies["event_id"] = @event.id
        
        if @event == nil
            redirect_to events_url, notice: "Event not found."
        end
    end
    
    def edit
        @locations = Location.all
        @universities = University.all
    end
    
    def new
        cookies.delete("event_id")
        @locations = Location.all
        @universities = University.all
        @event = Event.new
        render "new"
    end
    
    def update
        #@event = Event.new
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = params[:start_time]
        @event.end_time = params[:end_time]
        @event.description = params[:description]
        @event.organizer_contact_email = params[:organizer_contact_email]
        if @event.save
            redirect_to event_url, notice: "Edited event."
        else
            render "edit"
        end
    end
    
    #Delete event from database
    def destroy
        @event.delete
        redirect_to events_url
    end
    
end
