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
      post :create, event: FactoryGirl.attributes_for(:event)
      event.reload
      expect(Event.count).to eq(1)
      expect(event.user).to be_following(event)
    end
  end
end
