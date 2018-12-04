class EnrichSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :client_id, :integer
    add_foreign_key :sales, :users, column: :client_id
    add_column :sales, :trader_id, :integer
    add_foreign_key :sales, :users, column: :trader_id
  end
end
