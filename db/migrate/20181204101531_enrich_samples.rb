class EnrichSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :exporter_id, :integer
    add_foreign_key :samples, :users, column: :exporter_id
    add_column :samples, :trader_id, :integer
    add_foreign_key :samples, :users, column: :trader_id
  end
end
