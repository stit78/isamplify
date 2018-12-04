class PotentialClient < ApplicationRecord
  belongs_to :coffee_lot
  belongs_to :client, class_name: 'User'
end
