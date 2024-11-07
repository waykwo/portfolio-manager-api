class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :ticker
      t.text :description
      t.string :asset_class
      t.decimal :latest_price

      t.timestamps
    end
  end
end
