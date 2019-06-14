# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

 class AnswerChoice < ApplicationRecord

    belongs_to :question,
     primary_key: :id,
     foreign_key: :question_id,
     class_name: :question

    has_many :responses,
     primary_key: :id, 
     foreign_key: :answerchoice_id,
     class_name: :response
    
 end 
