class CoffeeLot < ApplicationRecord
  has_many :potential_clients
  has_many :samples
  has_many :coffee_certifications
  belongs_to :purchase_id
end
