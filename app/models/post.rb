class Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "author_id"
    has_many :likes
    has_many :comments

    def update_likes_counter_for_post
        self.update(LikesCounter: self.likes.count)
    end
end