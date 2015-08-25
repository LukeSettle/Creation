class EventsController < ApplicationController
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    authenticate_user!
    @event = Event.new
    @activities = Activity.all
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
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
