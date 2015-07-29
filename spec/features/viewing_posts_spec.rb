require 'spec_helper'

feature 'can view individual posts' do
  background do
    @post = create(:post, caption: 'Meee Owww')
  end

  scenario 'can click and view a single posts' do
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    expect(page.current_path).to eq(post_path(@post))
  end
end
