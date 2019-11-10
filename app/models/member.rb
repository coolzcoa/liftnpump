class Member < ApplicationRecord
    enum status: {
       active: 0,
       in_active: 1
    }
    belongs_to :package
end
