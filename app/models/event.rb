class Event < ActiveRecord::Base
  belongs_to :activity
  validates :activity, :time, :location, presence: true
end
