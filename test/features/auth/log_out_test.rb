require "test_helper"

feature 'As the site owner, I want to sign out a user to prevent fraud' do
  scenario 'a user signs in and signs out' do
    sign_in(:maria)
    click_link 'Log out'
    page.must_have_content 'Signed out successfully.'
  end
end
