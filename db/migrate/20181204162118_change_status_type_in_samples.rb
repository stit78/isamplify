class ChangeStatusTypeInSamples < ActiveRecord::Migration[5.2]
  def change
    remove_column :samples, :status
    add_column :samples, :status, :integer
  end
end
