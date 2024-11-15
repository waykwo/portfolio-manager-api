class RenameLastUpdatedInFinancialAsset < ActiveRecord::Migration[7.1]
  def change
    rename_column :financial_assets, :last_updated_date, :stock_info_last_update
  end
end
