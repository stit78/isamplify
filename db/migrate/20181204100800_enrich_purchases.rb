class EnrichPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :exporter_id, :integer
    add_foreign_key :purchases, :users, column: :exporter_id
    add_column :purchases, :trader_id, :integer
    add_foreign_key :purchases, :users, column: :trader_id
    add_column :purchases, :owner_id, :integer
    add_foreign_key :purchases, :users, column: :owner_id
  end
end
