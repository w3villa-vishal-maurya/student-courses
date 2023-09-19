class Student < ApplicationRecord
    validates :studFName, :studGender, :studLName, :yearOfEnroll, presence: true
    has_many :teachers 
    has_many :courses , through: :teachers
end
