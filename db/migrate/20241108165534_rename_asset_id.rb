class RenameAssetId < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :asset_id, :financial_asset_id
  end
end
