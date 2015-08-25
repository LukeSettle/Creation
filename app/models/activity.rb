class Activity < ActiveRecord::Base
  has_many :events
  belongs_to :event
end
