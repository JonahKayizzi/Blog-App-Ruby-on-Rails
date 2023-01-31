require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }

  it 'increments likes_counter of post' do
    user = User.create(name: 'John Doe', posts_counter: 0)
    post = user.posts.build(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    post.author_id = user.id
    post.save!
    like = post.likes.build(author_id: user.id)
    like.post_id = post.id
    like.save!
    expect(Post.find(post.id).likes_counter).to eq(1)
  end
end
