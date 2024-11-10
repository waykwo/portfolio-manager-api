class SetPrecisionAndScaleOfDecimalColumns < ActiveRecord::Migration[7.1]
  change_column :transactions, :shares, :decimal, precision: 12, scale: 6
  change_column :transactions, :cost_per_share, :decimal, precision: 10, scale: 2
  change_column :transactions, :subtotal, :decimal, precision: 15, scale: 2
end