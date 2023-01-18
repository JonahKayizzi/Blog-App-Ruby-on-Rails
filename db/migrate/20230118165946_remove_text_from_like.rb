class RemoveTextFromLike < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :Text, :string
  end
end
