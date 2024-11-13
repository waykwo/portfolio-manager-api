class RenameSubtotalToBookValue < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :subtotal, :book_value
  end
end
