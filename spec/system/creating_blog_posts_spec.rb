require 'rails_helper'

RSpec.describe "CreatingBlogPosts", driver: :selenium_chrome, js: true do

  it 'saves and displays the resulting blog post' do
    visit '/blog_posts/new'

    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'

    click_on 'Create Blog Post'

    expect(page).to have_content('Hello, World!')
    expect(page).to have_content('Hello, I say!')

    blog_post = BlogPost.order("id").last
    expect(blog_post.title).to eq('Hello, World!')
    expect(blog_post.body).to eq('Hello, I say!')
  end
end
