require 'rails_helper.rb'
require 'spec_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'delete me')
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can delete a post' do
    click_button 'Delete Post'
    expect(page).to have_content 'Post successfully deleted'
    expect(page).to_not have_content("delete me")
  end
end
