require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) {FactoryGirl.create(:event)}
  let(:user) {FactoryGirl.create(:user)}
  let(:activity) { FactoryGirl.create(:activity) }
  describe 'GET #index' do
    it 'works' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'authenticates users' do
      get :new
      expect(response).to have_http_status(:redirect)
    end
    it 'works' do
      sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'Events can be created' do
      sign_in(user)
      expect{post :create, event: {activity_id: activity.id, time: Time.now, address: 'Here'}}.to change{Event.count}.by(1)
    end
  end
end
