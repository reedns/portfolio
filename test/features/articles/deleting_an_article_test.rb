require 'test_helper'

feature 'deleting an article' do
  scenario 'user deletes an article' do
    visit articles_path
    click_link 'Destroy'
    page.wont_have_content('Cool Post')
  end
end
