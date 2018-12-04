class SimplifyCertifications < ActiveRecord::Migration[5.2]
  def change
    add_column :certifications, :name, :string
    remove_column :certifications, :fairtrade, :string
    remove_column :certifications, :rfa, :string
    remove_column :certifications, :organic, :string
    remove_column :certifications, :utz, :string
    remove_column :certifications, :quatrec, :string
    remove_column :certifications, :aaa, :string
    remove_column :certifications, :cafe_practice, :string
  end
end
