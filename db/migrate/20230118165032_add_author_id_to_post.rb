class AddAuthorIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :AuthourId, :integer
    add_index :posts, :AuthourId
  end
end
