require 'test_helper'

feature 'editing an article' do
  scenario 'site visitor cannot edit an article' do
    visit articles_path
    page.wont_have_content 'Edit'

    visit edit_article_path(articles(:article))
    page.wont_have_content articles(:article).title
  end


  scenario 'author can edit their own blog article' do
    sign_in(:author)

    visit articles_path
    click_link 'Edit'
    edit_article
    page.must_have_content 'New Title'
  end

  scenario "author cannot edit other author's articles" do
    sign_in(:author)

    visit edit_article_path(articles(:maria_draft))
    page.wont_have_content articles(:draft).title
  end

  scenario 'author cannot edit their own article via edit' do
    sign_in(:author)

    visit edit_article_path(articles(:draft))
    page.wont_have_content 'Published'
  end

  scenario 'editor can edit any article' do
    sign_in(:editor)

    visit edit_article_path(articles(:maria_draft))
    edit_article
    page.must_have_content 'New Title'
  end

  scenario 'editor can publish articles via edit' do
    sign_in(:editor)

    visit edit_article_path(articles(:draft))
    check 'Published'
    click_button 'Update Article'
    page.must_have_content 'Status: Published'
  end
end

def edit_article
  fill_in 'Title', with: 'New Title'
  click_button 'Update Article'
end
