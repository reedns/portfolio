require "test_helper"

feature 'As the site visitor, I want to be able sign into the site so that I can
take actions that require authentication' do
  scenario 'sign up with valid input' do
    visit new_user_registration_path
    fill_in 'Email', with: 'sally@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    page.must_have_content 'Welcome'
  end
end
