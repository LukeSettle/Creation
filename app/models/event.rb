class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  validates :activity, :time, :address, presence: true
  acts_as_followable
  default_scope { order(created_at: :desc) }
  after_create :owner_follows

  def owner_follows
    self.user.follow(self)
  end
end
