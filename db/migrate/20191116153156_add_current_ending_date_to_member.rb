class AddCurrentEndingDateToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :current_package_ending_date, :date
    add_column :members, :renewal_date, :date
  end
end
