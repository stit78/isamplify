class EnrichPotentialClients < ActiveRecord::Migration[5.2]
  def change
    add_column :potential_clients, :client_id, :integer
    add_foreign_key :potential_clients, :users, column: :client_id
  end
end
