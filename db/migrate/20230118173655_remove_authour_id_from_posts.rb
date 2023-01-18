class RemoveAuthourIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :AuthourId, :integer
  end
end
