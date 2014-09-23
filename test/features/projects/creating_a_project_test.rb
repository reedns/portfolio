require 'test_helper'

feature 'As the site owner, I want to add a portfolio item so that I can show off my work' do
  scenario 'creating a new project' do
    visit projects_path
    click_on 'New Project'

    fill_in 'Name', with: 'Portfolio App'
    fill_in 'Technologies used', with: "Ruby, Rails, HTML5, CSS, Zurb Foundation"
    click_button 'Save'

    page.must_have_content 'Success! New project created'
    page.status_code.must_equal 200
  end
  # scenario 'user does not succesfully create project'
end
