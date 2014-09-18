require 'test_helper'

feature 'creating and article' do
  scenario 'user creates a blog article' do
    visit new_article_path

    fill_in 'Title', with: articles(:article).title
    fill_in 'Author', with: articles(:article).author
    fill_in 'Content', with: articles(:article).content
    click_button 'Create'

    page.must_have_content(articles(:article).content)
  end
end
