class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  validates :activity, :time, :latitude, :longitude, presence: true
  acts_as_followable
end
