class Certification < ApplicationRecord
  has_many :coffee_certifications

  validates :name, presence: true, inclusion: { in: ["Fairtrade", "RFA", "Organic", "UTZ", "4C", "AAA", "Cafe Practice"] }
end
