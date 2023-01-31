require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
    before(:each) do
        @user = User.create(
            name: 'Abdul',
            bio: 'Aspiring FullStack Dev',
            photo: 'https://unsplash.com/photos/NDCy2-9JhUs',
        )

        @user2 = User.create(
            name: 'Jonathan',
            bio: 'FullStack Dev',
            photo: 'https://unsplash.com/photos/hodKTZow_Kk',
        )

        @post1 = Post.create(
            title: 'Test',
            text: 'First Post',
            author: @user
        )

        @comment1 = Comment.create(
            text: 'First Comment',
            post: @post1,
            author: @user2
        )

        @like1 = Like.create(
            post: @post1,
            author: @user2
        )

    end

    describe 'the post show page' do
        it 'displays the post title' do
            visit post_path(@post1)
            expect(page).to have_content('Test')
        end

        it 'displays the post author' do
            visit post_path(@post1)
            expect(page).to have_content('Abdul')
        end

        it 'displays number of comments' do
            visit post_path(@post1)
            expect(page).to have_content('1')
        end

        it 'displays number of likes' do
            visit post_path(@post1)
            expect(page).to have_content('1')
        end

        it 'displays the post text' do
            visit post_path(@post1)
            expect(page).to have_content('First Post')
        end

        it 'displays the commentor' do
            visit post_path(@post1)
            expect(page).to have_content('Jonathan')
        end

        it 'displays the comment text' do
            visit post_path(@post1)
            expect(page).to have_content('First Comment')
        end
    end
end

