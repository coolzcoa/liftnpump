class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|

      t.date :payment_date
      t.decimal :payment_amount
      t.timestamps
    end
  end
end
