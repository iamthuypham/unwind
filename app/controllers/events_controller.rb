class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    
    if @event.save
      flash[:notice] = "Event was saved successfully."
      redirect_to @event
    else
      flash.now[:alert] = "There was an error saving the event. Please try again."
      render :new
    end
  end
  private
 
   def event_params
     params.require(:event).permit(:name, :startdate, :enddate)
   end
end
