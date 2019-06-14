# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer
#

class Question < ApplicationRecord
    belongs_to :poll, 
     primary_key: :id,
     foreign_key: :poll_id,
     class_name: :poll

    has_many :answer_choices,
     primary_key: :id,
     foreign_key: :question_id,
     class_name: :answer_choice
    
end
