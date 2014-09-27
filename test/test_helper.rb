
ENV['RAILS_ENV'] = 'test'
# puts Rails.env
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'
require 'coveralls'
Coveralls.wear!('rails')

module ActiveSupport
  class TestCase
    ActiveRecord::Migration.check_pending!
    fixtures :all
    include Capybara::DSL
    Capybara.javascript_driver = :poltergeist
    Capybara.ignore_hidden_elements = false
  end
end

def sign_in(role = :editor)
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end
