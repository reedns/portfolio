require 'test_helper'

feature 'As a site visitor I want to see specific project' do
  scenario 'Viewing a single project' do
    visit projects_path(projects(:portfolio).id)
    page.must_have_content projects(:portfolio).name
  end
end
