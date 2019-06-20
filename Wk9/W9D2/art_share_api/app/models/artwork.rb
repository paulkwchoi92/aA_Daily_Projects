# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  artist_id  :integer
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord

    validates :title, presence: true, uniqueness: {scope: :artist_id}
    validates :title, presence: true

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id

    has_many :shares,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id
    
    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        dependent: :destroy

    has_many :likes, as: :likeable

    def self.gather(user_id)
        Artwork
            .joins(:shares)
            .where("artwork_shares.viewer_id = :id or artworks.artist_id = :id", id: user_id)
    end


    
end
