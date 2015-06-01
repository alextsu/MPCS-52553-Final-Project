#Purpose: Serve as controller to all event views in the web app

class EventsController < ApplicationController
    
    #Before filter checks for user login. Halt execution if not proper user present
    before_action :authorize, :only => [:edit, :update, :destroy] 
    before_action :find_event, :only => [:show, :edit, :update, :destroy]
    

    #Verify identity of user as event creator. Return "Nice try" if the creator id doesn't match
    def authorize
        @event = Event.find_by(id: params["id"])
        @user = User.find_by(id: @event.creator_id)
        if @user.blank? || session[:user_id] != @user.id
          redirect_to events_url, notice: "Nice try!"
        end
    end 


    #Search for event with paramter for the before filter
    def find_event
        @event = Event.find_by(id: params["id"])
    end
    

    #Display events
    def index

        #Handle event location search. First query all locations with city names containing the inputted keyword. Then using that array of location ids to get all events held at those locations
        if params["keyword"].present?
            location_ids = Location.where("city LIKE ?", "%#{params["keyword"]}")
            @events = Event.where(:location_id => location_ids)

        #Handle paginations past the first page manually. When user wants to view past first 100, call the database to display the next 100 by using the offset method. Set @events.
        elsif params["page"].present?
            @page = params["page"].to_i + 1
            @events = Event.limit(100).offset((params["page"].to_i - 1) * 100)

        #Otherwise, just display the first 100 Events
        else
            @page = 2
            @events = Event.limit(100) 
        end

        @events = @events.order('name asc')
        @event_count = @events.count
    end
    

    #Create new event by passing in all requisite fields from form and setting anew Event object to the inputted parameters. 
    def create
        #Limit queries, as per Jeff's allegory last class. 
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 

        #Create event and pass in the parameters based on form
        @event = Event.new
        @creator = User.find_by(id: session["user_id"])
        @event.creator_id = @creator.id 
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = DateTime.strptime(params[:start_time], '%m/%d/%Y %I:%M %p')
        @event.end_time = DateTime.strptime(params[:end_time], '%m/%d/%Y %I:%M %p')
        @event.description = params[:description]
        @event.organizer_contact_email = @creator.email

        #If the event saves successfully. Create a new EventSignup object. Set the creator as attending his/her newly created event. Then redirect
        if @event.save
            @eventsignup = EventSignup.new
            @user_id = @creator.id
            @event_id = @event.id
            @eventsignup.save
            redirect_to events_url, notice: "New event added."
        else
            render "new"
        end
    end
    

    #Present the details of an event when user selects one from index
    def show
        if @event != nil
            user_ids = EventSignup.where(event_id: @event.id).limit(1000).pluck(:user_id)
            @users = User.where(id: user_ids) 
            @logged_in_user_attending = @users.include?(User.find_by(id: session["user_id"])) 
        else 
            redirect_to events_url, notice: "Event not found."
        end
    end
    

    #Allow user to edit event if he/she is creator. Present the universities and locations for dropdown picker.
    def edit
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 
    end
    

    #Allow user to create new event. Present the universities and locations for dropdown picker.
    def new
        @universities = University.limit(2000)
        @locations = Location.limit(2000) 
        @event = Event.new
        render "new"
    end
    

    #Save the newly edited event with all the parameters that the user inputted
    def update
        @universities = University.limit(2000) 
        @locations = Location.limit(2000) 
        @event.creator_id = User.find_by(id: session["user_id"]).id 
        @event.name = params[:name]
        @event.university_id = University.find_by(:name => params[:university]).id
        @event.location_id = Location.find_by(:city => params[:location]).id
        @event.address = params[:address]
        @event.start_time = params[:start_time]
        @event.end_time = params[:end_time]
        @event.description = params[:description]
        @event.organizer_contact_email = params[:organizer_contact_email]
        if @event.save
            redirect_to event_url, notice: "Edit successful."
        else
            render "edit"
        end
    end
    

    #Delete event
    def destroy
        @event.delete
        redirect_to events_url, notice: "Event deleted."
    end
    
end
