# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  user_id         :integer
#  answerchoice_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Response < ApplicationRecord
    belongs_to :respondant,
     primary_key: :id,
     foreign_key: :user_id,
     class_name: :user

    belongs_to :answer_choice,
     primary_key: :id,
     foreign_key: :answerchoice_id,
     class_name: :answer_choice
    
end
