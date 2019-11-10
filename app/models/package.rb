class Package < ApplicationRecord
    enum package_type: {
        monthly: 0,
        quarterly: 1,
        halfyearly: 2,
        annually: 3,
        personal_training_monthly: 4,
        personal_training_quarterly: 5,
    }
    validates :price,:package_type, presence: true, uniqueness: true
    validates :price, numericality: { greater_than: 0 }
    has_many :members
end
