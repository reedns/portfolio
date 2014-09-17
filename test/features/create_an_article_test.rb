require 'test_helper'

feature 'creating and article' do
  scenario 'user creates a blog article' do
    visit new_article_path

    fill_in 'Title', with: 'New Post'
    fill_in 'Author', with: 'Maria Johnson'
    fill_in 'Content', with: 'This is my new post!'
    click_button 'Create'

    page.must_have_content('This is my new post!')
  end
end
