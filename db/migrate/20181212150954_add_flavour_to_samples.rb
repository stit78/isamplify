class AddFlavourToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :flavour, :text
  end
end
