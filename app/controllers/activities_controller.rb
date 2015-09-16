class ActivitiesController < ApplicationController
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
