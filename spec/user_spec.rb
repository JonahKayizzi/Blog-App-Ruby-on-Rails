require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to 0' do
    subject.posts_counter = 15
    expect(subject).to be_valid
  end

  it 'Return last three posts for user' do
    expect(subject.last_three_posts_for_user).to eq([])
  end
end
