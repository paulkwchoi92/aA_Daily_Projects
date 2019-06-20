class CreateArtworkShare < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :viewer_id, index: true, uniqueness: {scope: :artwork_id}, presence: true
      t.integer :artwork_id, index: true, presence: true
      t.timestamps
    end
  end
end
