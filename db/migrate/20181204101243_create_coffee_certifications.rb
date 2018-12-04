class CreateCoffeeCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_certifications do |t|
      t.references :coffee_lot, foreign_key: true
      t.references :certification, foreign_key: true

      t.timestamps
    end
  end
end
