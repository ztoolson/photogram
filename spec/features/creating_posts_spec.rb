require 'rails_helper.rb'
require 'spec_helper'

feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/awesome-cat.jpg')
    fill_in 'Caption', with: 'meow meow meow #awesomecat'
    click_button 'Create Post'
    expect(page).to have_content('#awesomecat')
    expect(page).to have_css("img[src*='awesome-cat.jpg']")
  end
end
