require "test_helper"

feature "visiting welcome page" do
  scenario "user can see the welcome message on the welcome page" do
    visit "http://www.reedns.net"
    page.must_have_content "Welcome"
  end
end
