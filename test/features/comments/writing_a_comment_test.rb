require 'test_helper'

feature 'creating a comment' do
  scenario 'site visitors can write comments but must wait for approval' do
    visit article_path(articles(:article))
    fill_in 'Author', with: comments(:comment).author
    fill_in 'Author email', with: comments(:comment).author_email
    fill_in 'Content', with: comments(:comment).content
    click_button 'Create comment'
    page.must_have_content 'Comment created! Approval pending.'
    page.wont_have_content comments(:comment).content
  end

  before do
    articles(:article).comments << comments(:comment)
  end

  scenario 'authors can approve comments on articles' do
    sign_in(:author)
    approve_comment
    page.must_have_content 'Comment approved!'
  end

  scenario 'editors can approve comments on articles' do
    sign_in(:editor)
    approve_comment
    page.must_have_content 'Comment approved!'
  end
end

def approve_comment
  visit article_path(articles(:article))
  click_button 'Approve'
end
