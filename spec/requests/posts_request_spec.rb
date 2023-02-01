require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      bio: 'Teacher from Mexico.',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      posts_counter: 2
    )

    @post = Post.create(
      author: @user,
      title: 'Post 3',
      text: 'This is my third post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'should get index' do
    get user_posts_path(@user)
    expect(response).to have_http_status(200)
  end

  it 'should get show' do
    get user_post_path(@user, @post)
    expect(response).to have_http_status(200)
  end

  it 'returns correct show template' do
    get user_post_path(@user, @post)
    expect(response).to render_template(:show)
  end

  it 'returns correct index template' do
    get user_posts_path(@user)
    expect(response).to render_template(:index)
  end

  it 'gets correct response body' do
    get user_post_path(@user, @post)
    expect(response.body).to include('Posts Detail')
  end

  it 'gets correct response body' do
    get user_posts_path(@user)
    expect(response.body).to include('Posts List')
  end
end
