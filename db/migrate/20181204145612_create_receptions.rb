class CreateReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :receptions do |t|

      t.timestamps
    end
  end
end
