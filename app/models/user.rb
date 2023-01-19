class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    def last_three_posts
        self.posts.order(created_at: :desc).limit(3)
    end

    def update_posts_counter
        self.update(PostsCounter: self.posts.count)
    end
end
