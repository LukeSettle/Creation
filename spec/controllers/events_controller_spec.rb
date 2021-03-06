require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) {FactoryGirl.create(:event)}
  let(:user) {FactoryGirl.create(:user)}
  let(:activity) { FactoryGirl.create(:activity) }
  describe 'GET #index' do
    it 'only does not work if not signed in' do
      get :index
      expect(response).to have_http_status(:redirect)
    end

    it 'works if signed in' do
      sign_in(user)
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
      user1 = user
      sign_in(user1)
      expect{post :create, event: {activity_id: activity.id, time: Time.now, address: 'Here'}}.to change{Event.count}.by(1)
      Event.first.user = user1
      expect(user1).to be_following(Event.first.activity)
    end
    it 'redirects if not signed in' do
      post :create, event: {activity_id: activity.id, time: Time.now, address: 'Here'}
      expect(response).to have_http_status(:redirect)
    end
  end
end
