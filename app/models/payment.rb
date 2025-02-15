class Payment < ApplicationRecord
    belongs_to :course
    belongs_to  :student

    enum status: { pending: 0, paid: 1, failed: 2}
end
