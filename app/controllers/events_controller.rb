class EventsController < ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result.paginate(page: params[:page], per_page: 15)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    authenticate_user!
    @event = Event.new
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
    params.require(:event).permit(:activity_id, :user_id, :latitude, :longitude, :is_public, :time)
  end
end
