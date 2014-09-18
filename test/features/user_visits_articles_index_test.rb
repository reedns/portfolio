require 'test_helper'

feature 'visit the article index' do
  scenario 'with existing articles' do

    visit articles_path
    page.must_have_content(articles(:article).title)
  end
end
