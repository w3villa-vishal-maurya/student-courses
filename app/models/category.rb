class Category < ApplicationRecord
    has_many :courses, :dependent => :destroy
end
