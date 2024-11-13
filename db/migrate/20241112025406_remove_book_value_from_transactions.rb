class RemoveBookValueFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :book_value, :decimal
  end
end
