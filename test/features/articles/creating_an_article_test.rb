require 'test_helper'

feature 'creating an article' do
  scenario 'author creates a blog article' do
    sign_in(:author)

    visit new_article_path
    fill_out_article_form
    click_button 'Create Article'

    page.must_have_content(articles(:article).body)
    page.has_css? "#author"
    page.must_have_content 'Status: Unpublished'
  end

  scenario 'unathenticated site visitors cannot create blog articles' do
    visit articles_path
    page.wont_have_content 'New Article'
  end

  scenario 'authors cannot publish' do
    sign_in(:author)

    visit new_article_path
    page.wont_have_content 'Published'
  end

  scenario 'editors can publish' do
    sign_in(:editor)

    visit new_article_path
    page.must_have_content 'Published'

    fill_out_article_form
    check 'Published'
    click_on 'Create Article'

    page.must_have_content 'Status: Published'
  end
end

private

def fill_out_article_form
  fill_in 'Title', with: articles(:article).title
  fill_in 'article_body', with: articles(:article).body
end
