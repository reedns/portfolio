require 'test_helper'

feature 'As the site visitor, I want to be able sign into the site so that I can
take actions that require authentication' do
  scenario 'sign up with valid input' do
    visit new_user_registration_path
    fill_in 'Email', with: 'sally@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
    page.must_have_content 'Welcome'
  end

  scenario 'sign in with twitter works' do
    visit root_path
    click_on 'Log In'
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] =
      Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] =
      OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                             uid: '12345',
                             info: { nickname: 'test_twitter_user' }
                             )
    click_on 'Sign in with Twitter'
    page.must_have_content 'Success! Signed in!'
  end
end
