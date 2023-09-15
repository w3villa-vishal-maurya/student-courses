class Course < ApplicationRecord
    has_many :teachers
    has_many :students, through: :teachers
end
