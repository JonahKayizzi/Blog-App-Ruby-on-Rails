require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      bio: 'Teacher from Mexico.',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      posts_counter: 2
    )
  end

  it 'should get index' do
    get '/users'
    expect(response).to have_http_status(200)
  end

  it 'should get show' do
    get user_path(@user)
    expect(response).to have_http_status(200)
  end

  it 'return correct show template' do
    get user_path(@user)
    expect(response).to render_template(:show)
  end

  it 'return correct index template' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'gets correct response body' do
    get user_path(@user)
    expect(response.body).to include('User Detail')
  end

  it 'gets correct response body' do
    get '/users'
    expect(response.body).to include('My Blog')
  end
end
