require 'test_helper'

feature 'editing an article' do
  scenario 'user edits a blog article' do
    sign_in

    visit edit_article_path(articles(:article))
    fill_in 'Title', with: 'New Title'
    click_button 'Update Article'
    page.must_have_content 'New Title'
  end
end
