require 'rails_helper'

RSpec.describe Like, type: :model do

    subject {Like.new(author_id: 1, post_id: 1)}

    before { subject.save }

    it 'Update likes counter for post' do
        expect(subject.post.LikesCounter).to eq(1)
    end
end


