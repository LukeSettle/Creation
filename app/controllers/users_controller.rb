class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @activities = Activity.all
    @upcoming_events = current_user.upcoming_events.paginate(page: params[:page], per_page: 10)
    @created_events = current_user.created_events.paginate(page: params[:page], per_page: 10)
  end
end
