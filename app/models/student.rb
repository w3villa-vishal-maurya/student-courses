class Student < ApplicationRecord
    has_many :teachers
    has_many :courses , through: :teachers
end
