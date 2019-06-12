class Visit < ApplicationRecord
    validates :url_id, presence: true

    def self.record_visit!(user, shortened_url)
        a = { user_id: user.id, url_id: shortened_url.id}
        Visit.create!(a)
    end

   belongs_to :visitors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

   belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

    
end