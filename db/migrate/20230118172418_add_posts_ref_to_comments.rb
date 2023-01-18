class AddPostsRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :PostId, null: false, foreign_key: true
  end
end
