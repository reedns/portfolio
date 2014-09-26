require 'test_helper'

feature 'displaying page styling from zurb foundation' do
  scenario 'user visits articles index' do
    visit articles_path
    page.find "div[class='small-9 columns']"
  end
end
