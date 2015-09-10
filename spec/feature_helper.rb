require 'rails_helper'
def capybara_sign_in(user)
  visit root_path
  find('.modal-trigger').click
  find('#new_session').fill_in 'Email', with: user.email
  find('#new_session').fill_in 'Password', with: user.password
  click_button 'Log in'
  expect(page).to have_content('Home')
end

def capybara_sign_out
  click_link "Sign Out"
end
