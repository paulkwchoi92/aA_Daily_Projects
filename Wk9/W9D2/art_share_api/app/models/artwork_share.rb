# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  viewer_id  :integer
#  artwork_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
    validates :viewer_id, uniqueness: {scope: :artwork_id}
    
    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id

    has_many :shared_viewers,
        through: :viewer

end
