class AddLastUpdatedToFinancialAsset < ActiveRecord::Migration[7.1]
  def change
    add_column :financial_assets, :last_updated_date, :date
  end
end
