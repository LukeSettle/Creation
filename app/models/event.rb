class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  validates :activity, :time, :location, presence: true
end
