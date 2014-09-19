require 'test_helper'

feature 'displaying page styling from zurb foundation' do
  scenario 'user visits welcome page' do
    visit root_path
    page.must_have_xpath('//link')
  end
end
