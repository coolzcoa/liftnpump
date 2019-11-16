class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference  :payments,:member, index: true,foreign_key: true
  end
end
