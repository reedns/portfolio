require 'test_helper'

feature 'deleting an article' do
  scenario 'site visitor cannot delete an article' do
    visit articles_path
    page.wont_have_content 'Destroy'
  end

  scenario 'author cannot delete an article' do
    sign_in(:author)
    visit articles_path
    page.wont_have_content 'Destroy'
  end

  scenario 'editor can delete an article' do
    sign_in(:editor)
    visit articles_path
    delete_article
    page.wont_have_content('Cool Post')
  end
end

def delete_article
  find("a[data-method='delete'][href='/articles/#{articles(:article).id}']").click
end
