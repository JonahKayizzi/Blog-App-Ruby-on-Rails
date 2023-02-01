require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Abdul',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
      posts_counter: 2
    )

    @post1 = Post.create(
      author: @user,
      title: 'Test',
      text: 'First Post',
      comments_counter: 1,
      likes_counter: 1
    )

    @post2 = Post.create(
      author: @user,
      title: 'Working?',
      text: 'Second Post',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  describe 'the user show page' do
    it 'displays the user profile picture' do
      visit user_path(@user)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/NDCy2-9JhUs']")
    end

    it ' displays user username' do
      visit user_path(@user)
      expect(page).to have_content('Abdul')
    end

    it 'shows the number of posts the user has written' do
      visit user_path(@user)
      expect(page).to have_content('2')
    end

    it 'displays the user bio' do
      visit user_path(@user)
      expect(page).to have_content('Aspiring FullStack Dev')
    end

    it 'display the first three posts by the user' do
      visit user_path(@user)
      expect(page).to have_content('First Post')
      expect(page).to have_content('Second Post')
    end

    it 'displays a button for all user posts' do
      visit user_path(@user)
      expect(page).to have_content('See all posts')
    end

    it 'click a user post, it redirects to that specific post show page' do
      visit user_path(@user)
      click_link 'Test'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    it 'click to see all posts, it redirects to the user post index page' do
      visit user_path(@user)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
