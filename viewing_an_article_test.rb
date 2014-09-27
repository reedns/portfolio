feature 'viewing an article' do
  scenario 'anyone can view an article' do
    visit articles_path
    click_link articles(:article).title
    page.must_have_content articles(:article).body
  end
end
