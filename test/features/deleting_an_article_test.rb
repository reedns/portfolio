require 'test_helper'

feature 'deleting an article' do
  scenario 'user deletes an article' do
    article = Article.create(title: "Cool Post", author: "Mary Madison", content: "A good post!")

    visit articles_path
    click_link "Delete Post"
    page.wont_have_content("Cool Post")
  end
end
