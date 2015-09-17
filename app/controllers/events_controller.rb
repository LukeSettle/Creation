class EventsController < ApplicationController
  def index
    authenticate_user!
      unless params[:search].blank?
        @events = current_user.followed_activity_events.search(params[:search]).paginate(page: params[:page], per_page: 15)
      else
        @events = current_user.followed_activity_events.paginate(page: params[:page], per_page: 15)
      end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    authenticate_user!
    @event = Event.new
  end

  def create
    authenticate_user!
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to root_path
    else
      flash[:warning] = "Your event was not saved"
      render 'new'
    end
  end

  def follow
    @event = Event.find(params[:event_id])
    current_user.follow(@event)
    flash[:alert] = "You joined an event!"
    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:activity_id, :latitude, :longitude, :address, :is_public, :time)
  end
end
