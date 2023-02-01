require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Abdul', bio: 'Aspiring FullStack Dev', photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
                        posts_counter: 2)
    @user2 = User.create(name: 'Jonathan', bio: 'FullStack Dev', photo: 'https://unsplash.com/photos/hodKTZow_Kk',
                         posts_counter: 2)
    @post1 = Post.create(title: 'Test', text: 'First Post', comments_counter: 0, likes_counter: 0, author: @user)
    @post2 = Post.create(title: 'Working?', text: 'Second Post', comments_counter: 0, likes_counter: 0, author: @user)
    @comment1 = Comment.create(text: 'First Comment', post: @post1, author: @user2)
    @comment2 = Comment.create(text: 'Second Comment', post: @post2, author: @user2)
    @like1 = Like.create(post: @post1, author: @user2)
  end

  describe 'the post index page' do
    it 'displays the users profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/NDCy2-9JhUs']")
    end

    it 'displays the users username' do
      visit user_posts_path(@user)
      expect(page).to have_content('Abdul')
    end

    it 'displays the number of posts the user has written' do
      visit user_posts_path(@user)
      expect(page).to have_content('2')
    end

    it 'displays the post title' do
      visit user_posts_path(@user)
      expect(page).to have_content('Test')
      expect(page).to have_content('Working?')
    end

    it 'displays the post text' do
      visit user_posts_path(@user)
      expect(page).to have_content('First Post')
      expect(page).to have_content('Second Post')
      expect(page).to_not have_content('This post')
    end

    it 'displays the first comment' do
      visit user_posts_path(@user)
      expect(page).to have_content('First Comment')
    end

    it 'displays the number of comments' do
      visit user_posts_path(@user)
      expect(page).to have_content('2')
    end

    it 'displays the number of likes' do
      visit user_posts_path(@user)
      expect(page).to have_content('1')
    end

    it 'displays Show all posts button' do
      visit user_posts_path(@user)
      expect(page).to have_content('More Posts')
    end

    it 'redirects to the post show page when clicked' do
      visit user_posts_path(@user)
      click_link 'First Post'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
