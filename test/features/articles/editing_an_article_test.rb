require 'test_helper'

feature 'editing an article' do
  scenario 'site visitor cannot edit an article' do
    visit articles_path
    page.wont_have_content 'Edit'

    visit edit_article_path(articles(:article))
    page.wont_have_content articles(:article).title
  end


  scenario 'author can edit only their own blog article' do
    sign_in(:author)

    visit articles_path
    click_link 'Edit'
    edit_article
    page.must_have_content 'New Title'

    visit edit_article_path(articles(:maria_draft))
    page.wont_have_content articles(:draft).title
  end

  scenario 'editor can edit any article' do
    sign_in(:editor)

    visit edit_article_path(articles(:maria_draft))
    edit_article
    page.must_have_content 'New Title'
  end
end

def edit_article
  fill_in 'Title', with: 'New Title'
  click_button 'Update Article'
end
