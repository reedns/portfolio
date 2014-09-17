require 'test_helper'

feature 'visit the article index' do
  scenario 'with existing articles' do
    article = Article.create(title: "New article", author: "Jane")

    visit articles_path
    page.must_have_content(article.title)
  end
end
