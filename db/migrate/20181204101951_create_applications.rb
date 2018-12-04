class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :sale, foreign_key: true
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
