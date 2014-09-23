require 'test_helper'

feature 'As the site owner, I want to edit a portfolio item so that I can update new project details' do
  scenario 'succesfully editing a project' do
    visit projects_path
    click_on_edit_link

    fill_in 'Name', with: "New Project"
    click_button 'Save'

    page.must_have_content 'New Project'
    page.wont_have_content 'How meta'
  end

  scenario 'submiting invalid data for editing a project' do
    visit projects_path
    click_on_edit_link

    fill_in 'Name', with: nil
    click_button 'Save'

    page.must_have_content 'Please fix errors below'
    page.must_have_content 'Edit Project'
  end
end

def click_on_edit_link
  find("a[href='/projects/#{projects(:portfolio).id}/edit']").click
end
