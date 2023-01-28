class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_create :update_comments_counter_for_post

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end
end
