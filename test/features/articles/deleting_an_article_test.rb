require 'test_helper'

feature 'deleting an article' do
  scenario 'user deletes an article' do
    sign_in(:editor)
    visit articles_path
    click_link 'Destroy'
    page.wont_have_content('Cool Post')
  end
end
