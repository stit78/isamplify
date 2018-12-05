class CoffeeCertification < ApplicationRecord
  belongs_to :coffee_lot
  belongs_to :certification
end
