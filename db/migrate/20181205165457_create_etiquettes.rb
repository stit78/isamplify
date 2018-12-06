class CreateEtiquettes < ActiveRecord::Migration[5.2]
  def change
    create_table :etiquettes do |t|
      t.references :sample, foreign_key: true

      t.timestamps
    end
  end
end
