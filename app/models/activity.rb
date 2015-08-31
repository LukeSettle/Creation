class Activity < ActiveRecord::Base
  has_many :events
  acts_as_followable
end
