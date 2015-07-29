require 'rails_helper'

feature 'can see a lost of posts on the index' do
  background do
    post_one = create(:post, caption: 'This is post one')
    post_two = create(:post, caption: 'This is the second post')
  end

  scenario 'the index lists all the posts' do
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='awesome-cat']")
  end
end
