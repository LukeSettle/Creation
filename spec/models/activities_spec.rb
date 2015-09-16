require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:activity) { FactoryGirl.create(:activity) }
  let(:user) { FactoryGirl.create(:user) }
  describe "#follow" do
    it "allows users to follow activities" do
      user.follow(activity)
      expect(activity.followers.count).to eq(1)
    end
  end
end
