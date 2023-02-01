require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 1, post_id: 1) }

  it 'increments comments_counter of post' do
    user = User.create(name: 'John Doe', posts_counter: 0)

    post = user.posts.build(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    post.author_id = user.id
    post.save!
    comment = post.comments.build(author_id: user.id)
    comment.post_id = post.id
    comment.save!
    expect(Post.find(post.id).comments_counter).to eq(1)
  end
end
