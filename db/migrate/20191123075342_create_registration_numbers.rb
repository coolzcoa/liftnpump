class CreateRegistrationNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_numbers do |t|
      t.integer :reg_no

      t.timestamps
    end
  end
end
