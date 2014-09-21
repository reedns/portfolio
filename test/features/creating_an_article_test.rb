require 'test_helper'

feature 'creating and article' do
  scenario 'user creates a blog article' do
    visit new_article_path
    save_and_open_page
    fill_in 'Title', with: articles(:article).title
    fill_in 'article_body', with: articles(:article).body
    click_button 'Save'

    page.must_have_content(articles(:article).body)
  end
end
