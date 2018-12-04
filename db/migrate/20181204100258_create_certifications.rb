class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
      t.string :fairtrade
      t.string :rfa
      t.string :organic
      t.string :utz
      t.string :quatrec
      t.string :aaa
      t.string :cafe_practice

      t.timestamps
    end
  end
end
