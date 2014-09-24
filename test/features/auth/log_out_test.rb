require "test_helper"

feature 'As the site owner, I want to sign out a user to prevent fraud' do
  scenario 'a user signs in and signs out' do
    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: users(:maria).email
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    click_link 'Log out'
    page.must_have_content 'Signed out successfully.'
  end
end
