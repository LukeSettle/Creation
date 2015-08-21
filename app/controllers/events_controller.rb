class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @activities = Activity.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
      flash[:warning]="Your event was not saved"
    end
  end

  private

  def event_params
    params.require(:event).permit(:activity_id, :location, :is_public, :time)
  end
end
