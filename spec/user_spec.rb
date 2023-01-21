require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should be present' do
    subject.Name = 'Tom'
    expect(subject).to be_valid
  end

  it 'PostsCounter should be integer' do
    subject.PostsCounter = '10'
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to 0' do
    subject.PostsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to 0' do
    subject.PostsCounter = 15
    expect(subject).to be_valid
  end

  it 'Return last three posts for user' do
    expect(subject.last_three_posts_for_user).to eq([])
  end
end
