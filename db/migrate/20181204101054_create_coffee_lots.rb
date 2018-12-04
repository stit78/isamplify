class CreateCoffeeLots < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_lots do |t|
      t.references :purchase, foreign_key: true
      t.string :provenance
      t.integer :quantity
      t.string :tree
      t.string :iconumber
      t.integer :screen_size
      t.string :cup_profile
      t.string :region
      t.string :quality_description

      t.timestamps
    end
  end
end
