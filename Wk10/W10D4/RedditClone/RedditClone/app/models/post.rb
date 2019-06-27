# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
    validates :title, :sub_id, :user_id, presence: true
    belongs_to :user 
    belongs_to :sub
end
