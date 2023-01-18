class ChangeFieldProperties2 < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :Text, :text
  end
end
