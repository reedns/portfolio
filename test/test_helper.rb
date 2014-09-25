ENV['RAILS_ENV'] = 'test'
puts Rails.env
require 'coveralls'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'

Coveralls.wear!

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
  Capybara.ignore_hidden_elements = false

  def sign_in
    visit new_user_session_path
    fill_in "Email", with: users(:jimbo).email
    fill_in "Password", with: 'password'
    click_on "Log in"
  end
end

