class AddAddressToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :address, :string, default: ''
  end
end
