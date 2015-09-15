require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:activity) { FactoryGirl.create(:activity) }
  let(:user) { FactoryGirl.create(:user) }
  describe "#show" do
    it "loads" do
      get :show, id: activity.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "#follow" do
    it "allows users to follow activities" do
      user.follow(activity)
      expect(activity.followers.count).to eq(1)
    end
  end
end
