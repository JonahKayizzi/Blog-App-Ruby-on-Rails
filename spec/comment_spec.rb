require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 1, post_id: 1, Text: 'This is a comment') }

  before { subject.save }

  it 'Update comments counter for post' do
    expect(subject.post.CommentsCounter).to eq(1)
  end
end
