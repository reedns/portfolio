require 'test_helper'

feature 'creating and article' do
  scenario 'user creates a blog article' do
    sign_in

    visit new_article_path
    fill_in 'Title', with: articles(:article).title
    fill_in 'article_body', with: articles(:article).body
    click_button 'Save'

    page.must_have_content(articles(:article).body)
    page.has_css? "#author"
    page.must_have_content users(:jimbo).email
  end
end
