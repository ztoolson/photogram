require 'rails_helper'

feature 'edit an existing post' do
  background do
    post = create(:post, caption: 'hooked on fonics')
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'edit an existing posts caption' do
    fill_in 'Caption', with: 'Wow I cannot spell. Better update that'
    click_button 'Update Post'
    expect(page).to have_content('Post successfully updated')
    expect(page).to have_content('Wow I cannot spell. Better update that')
  end
end
