class Content < ApplicationRecord
    belongs_to :course
    has_many :lectures
end
