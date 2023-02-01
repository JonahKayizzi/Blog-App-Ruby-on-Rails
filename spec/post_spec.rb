require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My first post', author_id: 1, comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'Title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be integer' do
    subject.comments_counter = '10'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be integer' do
    subject.likes_counter = '10'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Return five most recent comments for post' do
    expect(subject.five_most_recent_comments_for_post).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
end
