class CoffeeCertification < ApplicationRecord
  belongs_to :coffeelot_id
  belongs_to :certification_id
end
