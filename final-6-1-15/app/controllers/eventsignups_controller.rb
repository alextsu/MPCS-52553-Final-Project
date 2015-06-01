#Purpose: Serve as controller to event sign ups

class EventsignupsController < ApplicationController
    

    #Before filter checks for user login. Halt execution if not proper user present
    before_action :authorize, :only => [:destroy] 
    before_action :require_user, :only => [:create, :destroy]
    

    #Verify identity of user as event creator. Return "Nice try" if the creator id doesn't match
    def authorize
        @user_ids = EventSignup.where(event_id: params["event_id"]).pluck(:user_id)
        if @user_ids.blank? || !@user_ids.include?(session[:user_id])
          redirect_to events_url, notice: "You may only change your own event attendance."
        end
    end 


    #Verify user is logged in by checking if the session hash has an empty value for key "user_id"
    def require_user
      if session[:user_id].blank?
        redirect_to events_url, notice: "Login required."
      end
    end

    
    #Assign the specified user to the specified event by creating a new EventSignup object and saving their IDs as a row in this model.
    def create
        @eventsignup = EventSignup.new
        @eventsignup.user_id = User.find_by(id: session["user_id"]).id
        @eventsignup.event_id = params["event_id"]
        if @eventsignup.save
            redirect_to "/events/#{@eventsignup.event_id}", notice: "You've signed up for this event."
        else 
            render "/events", notice: "Error."
        end
    end
    

    #Remove specified user from event by querying database for EventSignup object with user and deleting that EventSignup object.
    def destroy
        @eventsignup = EventSignup.find_by(event_id: params["event_id"], user_id: session[:user_id])
        @eventsignup.delete
        redirect_to "/events/#{@eventsignup.event_id}", notice: "Event signup canceled."
    end
    
end
