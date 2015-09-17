require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:activity) { FactoryGirl.create(:activity) }
  let(:user) { FactoryGirl.create(:user) }
  describe "#show" do
    it "loads if signed in" do
      sign_in(user)
      get :show, id: activity.id
      expect(response).to have_http_status(:success)
    end

    it "redirects if not signed in" do
      get :show, id: activity.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
