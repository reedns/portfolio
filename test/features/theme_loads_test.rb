require 'test_helper'

feature 'theme loads when visiting page' do
  scenario 'navigation bar is present when visiting welcome page' do
    visit root_path
    page.find "nav[class='top-bar']"
  end
end
