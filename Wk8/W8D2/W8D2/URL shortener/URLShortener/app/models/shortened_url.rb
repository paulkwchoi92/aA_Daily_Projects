# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string
#  long_url   :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "SecureRandom"

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    def self.random_code
        short_url = SecureRandom::urlsafe_base64
        # surl = shortened_url.instance.execute (<<-SQL)
        #     SELECT 
        #     short_url
        #     FROM
        #     shortened_url
        # SQL
        # surl.map { |datum| Shortened_url.new(datum) }

        until !ShortenedUrl.exists?(short_url: short_url)
            short_url = SecureRandom::urlsafe_base64
        end
        short_url
     end

     def self.generate_new_url!(user, long_url)
        a = {user_id: user.id, short_url: ShortenedUrl.random_code, long_url: long_url}
        ShortenedUrl.create!(a)
        
     end

     def num_clicks
        num = ShortenedUrl.instance.execute(<<-SQL, long_ur)
            SELECT
             long_url, COUNT(*)
            FROM
             shortened_urls
            GROUP BY
             long_url
            HAVING
             COUNT(*) > 0
        SQL

     end

     def num_uniques
     end

     def num_recent_uniques
     end


     belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visits,
        foreign_key: :url_id,
        primary_key: :id,
        class_name: :Visit
    
end
