class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  validates :activity, :time, :address, presence: true
  acts_as_followable
  default_scope { order(created_at: :desc) }

  def self.search(query)
    q = "%#{query}%"
    Event.where("address ILIKE ? OR user ILIKE ?", q, q)
  end
end
