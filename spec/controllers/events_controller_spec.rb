require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) {FactoryGirl.create(:event)}
  let(:user) {FactoryGirl.create(:user)}
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
end
