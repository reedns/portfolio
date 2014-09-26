require 'test_helper'

feature 'visit the article index' do
  scenario 'everyone can view published articles' do
    visit articles_path
    page.must_have_content articles(:article).title
  end

  scenario 'an author sees their only their own drafts' do
    sign_in(:author)
    visit articles_path
    page.must_have_content articles(:draft).title
    page.wont_have_content articles(:maria_draft).title
  end
end
