class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  acts_as_follower
  acts_as_followable

  def followed_activity_events
    Event.where(activity: self.following_activities)
  end

  def unliked_activities
    Activity.all - self.following_activities
  end

  def upcoming_events
    self.following_events.where("time >= ?", Time.now)
  end
end
