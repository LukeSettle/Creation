class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render 'new'
      flash[:warning]="Your activity was not saved"
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @activity_events = @activity.events.paginate(page: params[:page], per_page: 15)
    authenticate_user!
      if params[:search] && params[:search] != ""
        @activity_events = @activity_events.search(params[:search]).paginate(page: params[:page], per_page: 15)
      else
        @activity_events = @activity_events.paginate(page: params[:page], per_page: 15)
      end
  end

  def follow
    @activity = Activity.find(params[:activity_id])
    current_user.follow(@activity)
    redirect_to user_path(current_user)
  end

  def unfollow
    @activity = Activity.find(params[:activity_id])
    current_user.stop_following(@activity)
    redirect_to user_path(current_user)
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
