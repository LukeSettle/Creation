require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:event) { FactoryGirl.create(:event) }
  describe "followed_activity_events" do
    it "returns events from followed activites" do
      event
      user.follow(event.activity)
      expect(user.followed_activity_events.count).to eq(1)
    end
  end

  describe "upcoming_events" do
    it "shows future events" do
      Timecop.freeze(Time.now) do
        event
        user.follow(event)
        expect(user.upcoming_events.count).to eq(1)
      end
    end
    it "doesn't show past events" do
      user.follow(event)
      Timecop.freeze(Time.now + 11.days) do
        expect(user.upcoming_events.count).to eq(0)
      end
    end
  end

  describe "unliked_activities" do
    let(:activities) { FactoryGirl.create_list(:activity, 5) }
    it "lists activites that aren't followed" do
      user.follow(activities.first)
      expect(user.unliked_activities.count).to eq(4)
    end
  end
end
