class AddBookValueColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :book_value, :decimal
  end
end
