class AddSubtotalToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :subtotal, :decimal
  end
end
