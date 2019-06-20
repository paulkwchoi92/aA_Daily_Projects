class CreateArtwork < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :artist_id, presence: true, index: true
      t.string :image_url, presence: true, uniqeness: true
      t.string :title, presence: true, uniqeness: {scope: :artist_id}
      t.timestamps
    end
  end
end
