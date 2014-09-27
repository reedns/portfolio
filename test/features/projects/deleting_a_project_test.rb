require 'test_helper'

feature 'As the site owner, I want to delete a portfolio item' do
  scenario 'Deleting a project' do
    visit projects_path
    destroy_project
    page.wont_have_content projects(:portfolio).name
  end
end

def destroy_project
  find("a[data-method='delete']
    [href='/projects/#{projects(:portfolio).id}']").click
end
