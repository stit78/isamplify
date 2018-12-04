class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :stage
      t.references :coffee_lot, foreign_key: true
      t.integer :sweetness
      t.integer :acidity
      t.integer :clean
      t.string :status

      t.timestamps
    end
  end
end
