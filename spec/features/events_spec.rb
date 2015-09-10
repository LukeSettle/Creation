require 'feature_helper'
RSpec.feature "Events" do
  let(:user) { FactoryGirl.create :user }
  let(:events) { FactoryGirl.create_list :event, 5 }
  let(:activities) { FactoryGirl.create_list :activity, 5}
  feature "Sign In" do
    scenario "can sign in" do
      activities
      activity = activities.first
      capybara_sign_in(user)
      expect(page).to have_content('Home')
    end
  end

  feature "event index" do
    background do
      events
      events.each do |event|
        user.follow(event.activity)
      end
    end
    scenario "shows all followed_activity_events" do
      capybara_sign_in(user)
      events.each do |e|
        expect(page).to have_content(e.time)
        expect(page).to have_content(e.address)
        expect(page).to have_content(e.user.email)
      end
    end
  end
  feature "event show" do
    scenario "shows event info" do
      capybara_sign_in(user)
      events.each do |e|
        visit event_path(e.id)
        expect(page).to have_content(e.time)
        expect(page).to have_content(e.activity.name)
        expect(page).to have_content(e.user.email)
      end
    end
  end
end
