require 'test_helper'

feature 'creating a comment' do
  scenario 'site visitors can write comments' do
    visit article_path(articles(:article))
    fill_in 'Author', with: comments(:comment).author
    fill_in 'Author email', with: comments(:comment).author_email
    fill_in 'Content', with: comments(:comment).content
    click_button 'Create comment'
    page.must_have_content 'Comment created! Approval pending.'
  end

  scenario 'authors can approve comments' do
    article(:articles).comments << comments(:comment)
    sign_in(:author)

    visit article_path(articles(:article))
    find_link 'Approve comment'
    check 'Approved'
    click_button 'Update comment'
    page.must_have_content
  end

  scenario 'editors can approve comments'
end
