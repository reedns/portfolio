require 'test_helper'

feature 'displaying page styling from zurb foundation' do
  scenario 'user visits welcome page' do
    visit articles_path
    save_and_open_page
    page.find "div[class='small-9 columns']"
  end
end

