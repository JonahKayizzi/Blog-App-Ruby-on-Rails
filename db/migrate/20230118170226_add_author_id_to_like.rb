class AddAuthorIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :AuthourId, :integer
    add_index :likes, :AuthourId
  end
end
