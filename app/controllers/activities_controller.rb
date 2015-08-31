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
  end

  def follow
    @activity = Activity.find(params[:activity_id])
    current_user.follow(@activity)
    redirect_to user_path(current_user)
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
