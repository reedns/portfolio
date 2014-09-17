require 'test_helper'

feature 'editing an article' do
  scenario 'user edits a blog article' do
    article_to_edit = Article.create(title: "New Post", author: "Jim Jones", content: "New stuff")

    visit edit_article_path(article_to_edit)
    fill_in "Title", with: "Cool New Post"
    click_button "Edit"
  end
end
