class Member < ApplicationRecord
    enum status: {
       active: 0,
       in_active: 1
    }
    belongs_to :package
    after_commit :date_of_ending, on: [:create]
    after_commit :change_registration_number, on: [:create, :update]
    has_many :payments, dependent: :destroy
    validates :registration_number,presence: true, uniqueness: true

    def date_of_ending
      if self.package.package_type == "annually"
        time_to_skip = 1.years
      elsif self.package.package_type == "monthly" || self.package.package_type == "personal_training_monthly"
        time_to_skip = 1.months
      elsif self.package.package_type == "quarterly" ||   self.package.package_type == "personal_training_quarterly"
        time_to_skip = 3.months
      elsif self.package.package_type == "halfyearly"
        time_to_skip = 6.months
      else
      end
      self.current_package_ending_date = self.renewal_date + time_to_skip
    end

    def change_registration_number
      if RegistrationNumber.first.reg_no == self.registration_number
         new_number = RegistrationNumber.first.reg_no + 1
         puts new_number
         RegistrationNumber.first.update(reg_no: new_number)
      end
    end
end
