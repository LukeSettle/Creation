require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe "#show" do
    it 'loads' do
      u = user
      sign_in(u)
      get :show, id: u.id
      expect(response).to have_http_status(:success)
    end
  end
end
