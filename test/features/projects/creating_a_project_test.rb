require 'test_helper'

feature 'As the site owner, I want to add a portfolio item so that I can show off my work' do
  scenario 'creating a new project' do
    visit projects_path
    click_on 'New Project'

    fill_in 'Name', with: 'Portfolio App'
    fill_in 'Technologies used', with: 'Ruby, Rails, HTML5, CSS, Zurb Foundation'
    click_button 'Save'

    page.must_have_content 'Success! New project created.'
    page.status_code.must_equal 200
  end

  scenario 'submiting invalid data for creating a new project' do
    visit new_project_path

    fill_in 'Name', with: nil
    fill_in 'Technologies used', with: 'Ruby on Rails'
    click_button 'Save'

    page.must_have_content 'Please fix errors below.'
    page.must_have_content 'New project'
  end
end
