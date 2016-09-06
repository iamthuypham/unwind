class ActivitiesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @activity = @event.activities.new(activity_params)

    if @activity.save
      flash[:notice] = "Activity was saved successfully."
      redirect_to @activity.event
    else
      flash.now[:alert] = "There was an error saving the activity. Please try again."
      redirect_to @activity.event
    end
  end
  def update
    @event = Event.find(params[:event_id])
    @activity = @event.activities.find(params[:id])
    @activity.completed = true
     if @activity.save
      flash[:notice] = "Activity was updated successfully."
      redirect_to @activity.event
     else
       flash.now[:alert] = "There was an error saving the activity. Please try again."
      redirect_to @activity.event
     end
  end
  def destroy
    @activity = Activity.find(params[:id])

     if @activity.destroy
       flash[:notice] = "\"#{@activity.name}\" was deleted successfully."
       redirect_to @activity.event
     else
       flash.now[:alert] = "There was an error deleting the activity."
       redirect_to @activity.event
     end
  end
  
  private
 
  def activity_params
    params.require(:activity).permit(:name, :starttime, :completed)
  end
end
