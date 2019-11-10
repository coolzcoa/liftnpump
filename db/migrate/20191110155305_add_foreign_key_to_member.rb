class AddForeignKeyToMember < ActiveRecord::Migration[5.1]
  def change
    add_reference  :members, :package,index: true,foreign_key: true
  end
end
