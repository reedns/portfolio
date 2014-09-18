require 'test_helper'

feature 'editing an article' do
  scenario 'user edits a blog article' do

    visit edit_article_path(articles(:article))
    fill_in "Title", with: articles(:article).title
    click_button "Edit"
  end
end
