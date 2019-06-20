class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :likeable_id, polymorphic: true, index: true
      t.timestamps
    end
  end
end
