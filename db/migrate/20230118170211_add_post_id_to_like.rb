class AddPostIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :PostId, :integer
    add_index :likes, :PostId
  end
end
