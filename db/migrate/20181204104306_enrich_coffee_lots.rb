class EnrichCoffeeLots < ActiveRecord::Migration[5.2]
  def change
    add_reference :coffee_lots, :sale, foreign_key: true
  end
end
