class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.integer :package_type
      t.decimal :price

      t.timestamps
    end
  end
end
