class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :registration_number, default: 0, null: false
      t.string :name, default:'',null: false
      t.date :date_of_birth
      t.date :date_of_joining
      t.string :phone, default: '', null: false
      t.string :email_id, default: '',null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
