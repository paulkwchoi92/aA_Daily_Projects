class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id, index: true, null: false
      t.integer :artwork_id, index: true, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
