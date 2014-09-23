require "test_helper"

feature 'As the site owner, I want to delete a portfolio item' do
  scenario 'Deleting a project' do
    visit projects_path
    find("a[data-method='delete'][href='/projects/#{projects(:portfolio).id}']").click
    page.wont_have_content projects(:portfolio).name
  end
end
