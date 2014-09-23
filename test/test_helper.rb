ENV['RAILS_ENV'] = 'test'
# puts Rails.env
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class FeatureSpec < MiniTest::Spec
  require 'capybara/poltergeist'
  include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
  register_spec_type(/page$/, self)
end

Capybara.ignore_hidden_elements = false
