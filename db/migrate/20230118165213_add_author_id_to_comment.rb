class AddAuthorIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :AuthourId, :integer
    add_index :comments, :AuthourId
  end
end
