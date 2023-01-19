class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def five_most_recent_comments_for_user(user)
    user.comments.order(created_at: :desc).limit(5)
  end
end
