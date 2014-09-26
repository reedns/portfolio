require 'test_helper'

feature "As a site visitor I want to see a developer's projects" do
  scenario 'Viewing all the projects' do
    visit projects_path
    page.must_have_content projects(:portfolio).name
    page.must_have_content projects(:freelance).name
  end
end
