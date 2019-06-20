require 'action_view'

class Cat < ApplicationRecord
    COLORS = [
        "Fuscia",
        "Pink",
        "Turquoise",
        "Yellow",
        "Purple",
        "Maroon",
    ]

    validates :birth_date, :name, presence: true
    validates :color, inclusion: { in: COLORS }
    validates :sex, inclusion: { in: %w(M F) }


    def age
         age = Date.today.year - birth_date.year
    end 
end