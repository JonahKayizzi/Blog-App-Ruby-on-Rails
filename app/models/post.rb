class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  after_create :update_posts_counter_for_user

  def update_posts_counter_for_user(user)
    user.increment!(:PostsCounter)
  end

  def five_most_recent_comments_for_post
    comments.order(created_at: :desc).limit(5)
  end
end
