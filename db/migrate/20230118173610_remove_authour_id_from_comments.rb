class RemoveAuthourIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :AuthourId, :integer
  end
end
