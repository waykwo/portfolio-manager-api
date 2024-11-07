class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :asset_id
      t.decimal :shares
      t.decimal :cost_per_share
      t.date :trade_date

      t.timestamps
    end
  end
end
