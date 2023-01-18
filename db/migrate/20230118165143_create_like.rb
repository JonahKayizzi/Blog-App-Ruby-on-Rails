class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :Text

      t.timestamps
    end
  end
end
