require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(id: 1, Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(id: 1, author_id: user.id, Title: 'Post 3', Text: 'This is my third post') }

  it 'should get index' do
    get "/users#{user.id}/posts"
    expect(response).to have_http_status(200)
  end

  it 'should get show' do
    get "/users#{user.id}/posts#{post.id}"
    expect(response).to have_http_status(200)
  end

  it 'returns correct show template' do
    get "/users#{user.id}/posts#{post.id}"
    expect(response).to render_template(:show)
  end

  it 'returns correct index template' do
    get "/users#{user.id}/posts"
    expect(response).to render_template(:index)
  end

  it 'gets correct response body' do
    get "/users#{user.id}/posts#{post.id}"
    expect(response.body).to include('Here is a post for a given user')
  end

  it 'gets correct response body' do
    get "/users#{user.id}/posts"
    expect(response.body).to include('Here is a list of posts for a given user')
  end
end
