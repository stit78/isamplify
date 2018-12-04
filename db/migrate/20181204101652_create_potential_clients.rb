class CreatePotentialClients < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_clients do |t|
      t.references :coffee_lot, foreign_key: true

      t.timestamps
    end
  end
end
