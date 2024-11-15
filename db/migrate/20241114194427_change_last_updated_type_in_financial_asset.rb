class ChangeLastUpdatedTypeInFinancialAsset < ActiveRecord::Migration[7.1]
  def change
    change_column :financial_assets, :stock_info_last_update, :datetime
  end
end
