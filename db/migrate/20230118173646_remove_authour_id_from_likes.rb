class RemoveAuthourIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :AuthourId, :integer
  end
end
