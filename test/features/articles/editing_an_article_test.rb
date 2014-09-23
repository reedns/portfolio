require 'test_helper'

feature 'editing an article' do
  scenario 'user edits a blog article' do

    visit edit_article_path(articles(:article))
    fill_in 'Title', with: 'New Title'
    click_button 'Save'
    page.must_have_content 'New Title'
  end
end
