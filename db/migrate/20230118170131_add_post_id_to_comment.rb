class AddPostIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :PostId, :integer
    add_index :comments, :PostId
  end
end
