class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(PostsCounter: posts.count)
  end
end
