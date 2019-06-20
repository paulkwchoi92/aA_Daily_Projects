class FixLikesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :likes
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
