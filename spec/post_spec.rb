require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'My first post', author_id: 1, CommentsCounter: 0, LikesCounter: 0) }

  before { subject.save }

  it 'Title should be present' do
    subject.Title = ''
    expect(subject).to_not be_valid
  end

  it 'Title should not be too long' do
    subject.Title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be integer' do
    subject.CommentsCounter = '10'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to 0' do
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be integer' do
    subject.LikesCounter = '10'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be greater than or equal to 0' do
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to 0' do
    subject.CommentsCounter = 15
    expect(subject).to be_valid
  end

  it 'LikesCounter should be greater than or equal to 0' do
    subject.LikesCounter = 15
    expect(subject).to be_valid
  end

  it 'Update posts counter for user' do
    expect(subject.user.PostsCounter).to eq(1)
  end

  it 'Return five most recent comments for post' do
    expect(subject.five_most_recent_comments_for_post).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
end
