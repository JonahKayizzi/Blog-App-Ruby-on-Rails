class ChangeFieldProperties < ActiveRecord::Migration[7.0]
  def change
      change_column :users, :Bio, :text
      change_column :posts, :Text, :text
  end
end
