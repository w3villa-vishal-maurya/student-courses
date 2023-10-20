class Course < ApplicationRecord
    validates :courseTitle, :courseDuration, :courseDescription, :courseModule, :coursePrice, presence: true
    has_many :teachers
    has_many :students, through: :teachers
    has_many :contents

    belongs_to :category
    has_one_attached :course_image
end
