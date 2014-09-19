require 'test_helper'

feature 'creating and article' do
  scenario 'user creates a blog article' do
    visit new_article_path

    fill_in 'Title', with: articles(:article).title
    fill_in 'Body', with: articles(:article).body
    click_button 'Create'

    page.must_have_content(articles(:article).body)
  end
end
