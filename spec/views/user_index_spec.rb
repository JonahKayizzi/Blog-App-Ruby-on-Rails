require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Abdul',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Jonathan',
      bio: 'FullStack Dev',
      photo: 'https://unsplash.com/photos/hodKTZow_Kk',
      posts_counter: 3
    )
  end

  describe 'user index paged' do
    it 'displays correct username' do
      visit users_path
      expect(page).to have_content('Abdul')
      expect(page).to have_content('Jonathan')
      expect(page).to_not have_content('Caicedo')
    end

    it 'shows user profile photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://unsplash.com/photos/NDCy2-9JhUs']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/hodKTZow_Kk']")
    end

    it 'shows the correct number of posts' do
      visit users_path

      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the user_path when clicked' do
      visit users_path
      click_link 'Abdul'
      expect(page).to have_current_path(user_path(@user1))
    end

    it 'it shows the bio in show path' do
      visit users_path
      click_link 'Jonathan'
      expect(page).to have_content('FullStack Dev')
    end
  end
end
