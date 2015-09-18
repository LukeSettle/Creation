class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  validates :activity, :time, :address, presence: true
  acts_as_followable
  default_scope { order(created_at: :desc) }
  after_create :owner_follows
  after_create :owner_follows_activity

  def owner_follows
    self.user.follow(self)
  end

  def owner_follows_activity
    self.user.follow(self.activity)
  end

  def self.search(query)
    q = "%#{query}%"
    Event.where("address ILIKE ? OR user ILIKE ?", q, q)
  end

end
