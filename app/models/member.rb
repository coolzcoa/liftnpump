class Member < ApplicationRecord
    enum status: {
       active: 0,
       in_active: 1
    }
    belongs_to :package
    after_commit :date_of_ending, on: [:create]

    def date_of_ending

      self.renewal_date = self.date_of_joining
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

    def create_notifications
      Member.all.each{ |member|
        print("hi")
        if Date.now > member.current_package_ending_date && member.status.active
          member.update_columns(status: 1)
        end
      }
    end
end
